integer a;
integer n;

function factorial(){
	a=1;
	loop1:
	a=n*a;
	n=n-1;
	if n>1 goto loop1 else goto l1;
	l1:
}

function main(){
	n=5;
	factorial();
}