%%��ŷ���ǣ�Euler angle������ȡ��misorientation��
% ע�⣺1���˴�ֻ��������֪����ŷ����֮����μ��㾧����ȡ��������δ�ebsd��������õ���Ӧ������ŷ���ǣ������в���������ϣ�2���˴�����������ϵ��
%% ��������ŷ����(��λΪ�ȣ��ǻ���ֵ)�����磺A1=[281.7 33.3 2.7]
disp('������ŷ����A1(��1,��,��2)');
A1=input('A1=');
disp('������ŷ����A2(��1,��,��2)');
A2=input('A2=');
a=A1(1);
b=A1(2);
c=A1(3);
d=A2(1);
e=A2(2);
f=A2(3);
%% �ֱ�����ŷ����ת����ȡ�����g1��g2
g1=[cosd(a)*cosd(c)-sind(a)*sind(c)*cosd(b),sind(a)*cosd(c)+cosd(a)*sind(c)*cosd(b),sind(c)*sind(b);
    -cosd(a)*sind(c)-sind(a)*cosd(c)*cosd(b),-sind(a)*sind(c)+cosd(a)*cosd(c)*cosd(b),cosd(c)*sind(b);
    sind(a)*sind(b),-cosd(a)*sind(b),cosd(b)];
g2=[cosd(d)*cosd(f)-sind(d)*sind(f)*cosd(e),sind(d)*cosd(f)+cosd(d)*sind(f)*cosd(e),sind(f)*sind(e);
    -cosd(d)*sind(f)-sind(d)*cosd(f)*cosd(e),-sind(d)*sind(f)+cosd(d)*cosd(f)*cosd(e),cosd(f)*sind(e);
    sind(d)*sind(e),-cosd(d)*sind(e),cosd(e)];
%% ������ת����A�� ��g2����g1�������
A = g2/g1;
%% �Ծ���������Ա任��ʹ����Խ�Ԫ��Ϊ�������к��е����ֵ��
[row,col] = size(A);
flag = 1;
while 1
[maxrow,maxcol] = find( A == max(max(A(flag:row,flag:col))) ); % ���ֵ����
maxrow = maxrow(end);
maxcol = maxcol(end); % ���ж����ͬ���ֵ�����, ͳһȡ���һ��
% ����:
A([flag maxrow],:)=A([maxrow flag],:);
% ����:
A(:,[flag maxcol])=A(:,[maxcol,flag]);
flag = flag + 1;
if flag > row-1
break;
end
end
A
%% �����ϲ��õ�����ת���󣬵ó���ת�Ǻ���ת��
% ��ת��theta(��λΪ�ȣ��ǻ���ֵ)
B=A(1,1)+A(2,2)+A(3,3)-1;
theta=acosd(0.5*B)
% ��ת��C
C=1/(2*sind(theta))*[A(3,2)-A(2,3),A(1,3)-A(3,1),A(2,1)-A(1,2)]





