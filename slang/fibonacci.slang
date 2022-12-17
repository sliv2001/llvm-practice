integer prev;
integer new;
integer temp;
integer n;

integer res[5];

function fibonacci(){
	prev=0;
	new=1;
	n=n-1;
	loop1:
	temp=new;
	new=prev+new;
	prev=temp;
	n=n-1;
	if n>0 goto loop1 else goto l1;
	l1:
}
function main(){
	n=3;
	res[0]=1;
	res[1]=1;
	fibonacci();
	res[2]=new;
	n=4;
	fibonacci();
	res[3]=new;
	n=5;
	fibonacci();
	res[4]=new;
	fibonacci();
}