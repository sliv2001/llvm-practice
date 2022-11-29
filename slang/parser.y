%{

#include <iostream>
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Support/TargetSelect.h"

#define YYSTYPE llvm::Value*

extern "C" {
	int yyparse();
	int yylex();
	void yyerror(char *s) {
		std::cerr << s << "\n";
	}
//	int yywrap(void){return 1;}
}

llvm::LLVMContext context;
llvm::IRBuilder<>* builder;
llvm::Module* module;
llvm::Function *curFunc;

typedef struct {
    llvm::GlobalVariable* irVal;
    int realVal;
} value_t;
std::map<std::string, value_t> ValueMap;


typedef struct {
    llvm::GlobalVariable* irVal;
    int size;
    int initVal;
    int* realVal;
} array_t;
std::map<std::string, array_t> ArrayMap;

std::map<std::string, llvm::BasicBlock *> BBMap;

%}

%token NUM FUNCTION IF GOTO INTEGER IDENTIFIER

%%

Parse:		Program {YYACCEPT;}
;

Program:	funcDecl
			| varDecl
			| Program varDecl
			| Program funcDecl
;

varDecl:	INTEGER IDENTIFIER ';'	{
										printf("integer %s;\n", (char*)$2);
										module->getOrInsertGlobal((char*)$2, builder->getInt32Ty());
										value_t val;
										val.irVal = module->getNamedGlobal((char*)$2);
										val.realVal = 0;
										ValueMap.insert({(char*)$2, val});
									}
			| INTEGER IDENTIFIER '[' NUM ']' ';'	{
														printf("integer %s [%s];\n", (char*)$2, (char*)$4);
														int size = atoi((char*)$4);
														llvm::ArrayType *arrayType = llvm::ArrayType::get(builder->getInt32Ty(), size);
														module->getOrInsertGlobal((char*)$2, arrayType);
														array_t arr;
														arr.irVal = module->getNamedGlobal((char*)$2);
														arr.size = size;
														arr.initVal = 0;
														ArrayMap.insert({(char*)$2, arr});
													}
			;

funcDecl:	FUNCTION IDENTIFIER '(' ')'	{
											printf("function %s\n", (char*)$2);
											llvm::Function *func = module->getFunction((char*)$2);
                                            if (func == nullptr) {
												llvm::FunctionType *funcType = llvm::FunctionType::get(builder->getVoidTy(), false);
												func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, (char*)$2, module);
                                            }
                                            curFunc = func;
                                            llvm::BasicBlock *entryBB = llvm::BasicBlock::Create(context, "entry", curFunc);
                                            builder->SetInsertPoint(entryBB);
										} '{' statements '}'	{
																	printf("FunctionEnd\n");
																	builder->CreateRetVoid();
																}
																;
										
statements:	/*NOTHING*/
			| statements statement
			;
			
statement:	assignment	{printf("Assignment\n");}
			| funcCall		{printf("Function Call\n");}
			| ifStatement	{printf("IfStatement\n");}
			| label			{printf("Label\n");}
			| goto			{printf("GoTo\n");}
			;
			
assignment:	variable '=' expression ';' {
											printf("variable '=' expression ';'\n");
											builder->CreateStore($3, $1);
										}
										;

funcCall:	IDENTIFIER '(' ')' ';'	{
										llvm::Function *func = module->getFunction((char*)$2);
										if (func == nullptr) {
											llvm::FunctionType *funcType = llvm::FunctionType::get(builder->getVoidTy(), false);
											func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, (char*)$2, module);
										}
										builder->CreateCall(func);
									}
									;
									
ifStatement:	IF expression GOTO IDENTIFIER ';'	{
														if (BBMap.find((char*)$4) == BBMap.end()) {
															BBMap.insert({(char*)$4, llvm::BasicBlock::Create(context, (char*)$4, curFunc)});
														}
														llvm::Value *cond = builder->CreateICmpNE($2, builder->getInt32(0));
														builder->CreateCondBr(cond, BBMap[(char*)$4], nullptr/*Builder.GetInsertBlock()*/); /*TODO Check this out*/
													}
									;				
label:	IDENTIFIER ':'	{
							if (BBMap.find((char*)$1) == BBMap.end()) {
                                BBMap.insert({(char*)$1, llvm::BasicBlock::Create(context, (char*)$1, curFunc)});
                            }
                            llvm::BasicBlock *BB = BBMap[(char*)$1];
                            builder->CreateBr(BB);
                            builder->SetInsertPoint(BB);
						}
						;
						
goto:	GOTO IDENTIFIER ';'	{
								if (BBMap.find((char*)$2) == BBMap.end()) {
                                    BBMap.insert({(char*)$2, llvm::BasicBlock::Create(context, (char*)$2, curFunc)});
                                }
                                llvm::BasicBlock *BB = BBMap[(char*)$2];
                                builder->CreateBr(BB);
							}
;

expression:	simple
            | expression '!''=' simple { $$ = builder->CreateZExt(builder->CreateICmpNE($1, $4), builder->getInt32Ty()); }
            | expression '=''=' simple { $$ = builder->CreateZExt(builder->CreateICmpEQ($1, $4), builder->getInt32Ty()); }
            | expression '<'    simple { $$ = builder->CreateZExt(builder->CreateICmpSLT($1, $3), builder->getInt32Ty()); }
            | expression '<''=' simple { $$ = builder->CreateZExt(builder->CreateICmpSLE($1, $4), builder->getInt32Ty()); }
            | expression '>'    simple { $$ = builder->CreateZExt(builder->CreateICmpSGT($1, $3), builder->getInt32Ty()); }
            | expression '>''=' simple { $$ = builder->CreateZExt(builder->CreateICmpSGE($1, $4), builder->getInt32Ty()); }
;

simple:     Summand
            | simple '+' Summand { $$ = builder->CreateAdd($1, $3); }
            | simple '-' Summand { $$ = builder->CreateSub($1, $3); }
;

Summand:    Factor
            | Summand '*' Factor  { $$ = builder->CreateMul($1, $3); }
            | Summand '/' Factor  { $$ = builder->CreateSDiv($1, $3); }
            | Summand '%' Factor  { $$ = builder->CreateSRem($1, $3); }
;

Factor:     Primary { $$ = $1; }
            | '-' Primary { $$ = builder->CreateNeg($2); }
            | '(' expression ')' { $$ =$2; }
;

Primary:    NUM { $$ = builder->getInt32(atoi((char*)$1)); }
            | variable { $$ = builder->CreateLoad($1->getType(), $1); }
;

variable:      IDENTIFIER  {
                            $$ = builder->CreateConstGEP1_32(ValueMap[(char*)$1].irVal->getType(), ValueMap[(char*)$1].irVal, 0);
                        }
            | IDENTIFIER '[' expression ']' {
                            llvm::ArrayType *arrayType = llvm::ArrayType::get(builder->getInt32Ty(), ArrayMap[(char*)$1].size);
                            std::vector<llvm::Value *> gepArgs;
                            gepArgs.push_back(builder->getInt32(0));
                            gepArgs.push_back($3);
                            $$ = builder->CreateGEP(arrayType, ArrayMap[(char*)$1].irVal, gepArgs);
                        }
;

%%

int main(int argc, char **argv){
	llvm::InitializeNativeTarget();
	llvm::InitializeNativeTargetAsmPrinter();
	
	module = new llvm::Module("top", context);
	builder = new llvm::IRBuilder<> (context);
	
	yyparse();
	
	llvm::outs() << "#[LLVM IR]:\n";
    module->print(llvm::outs(), nullptr);
    
    llvm::outs() << "Running code...\n";
	llvm::ExecutionEngine *ee = llvm::EngineBuilder(std::unique_ptr<llvm::Module>(module)).create();

    for (auto& value : ValueMap) {
        ee->addGlobalMapping(value.second.irVal, &value.second.realVal);
    }
    for (auto& array : ArrayMap) {
        array.second.realVal = new int[array.second.size];
        for (int i = 0; i < array.second.size; i++) {
            array.second.realVal[i] = array.second.initVal;
        }
        ee->addGlobalMapping(array.second.irVal, array.second.realVal);
    }

    ee->finalizeObject();
	std::vector<llvm::GenericValue> noargs;
    llvm::Function *mainFunc = module->getFunction("main");
    if (mainFunc == nullptr) {
	    llvm::outs() << "Can't find main\n";
        return -1;
    }
	ee->runFunction(mainFunc, noargs);
	llvm::outs() << "Code was run.\n";

    for (auto& value : ValueMap) {
        llvm::outs() << value.first << " = " <<  value.second.realVal << "\n";
    }
    for (auto& array : ArrayMap) {
        llvm::outs() << array.first << "[" << array.second.size << "] =";
        for (int i = 0; i < array.second.size; i++) {
            llvm::outs() << " " << array.second.realVal[i];
        }
        llvm::outs() << "\n";
        delete array.second.realVal;
    }
    
    return 0;
}