%%从欧拉角（Euler angle）计算取向差（misorientation）
% 注意：1）此处只是讨论已知两组欧拉角之后，如何计算晶粒的取向差，关于如何从ebsd处理软件得到对应晶粒的欧拉角，请自行查找相关资料；2）此处仅讨论立方系。
%% 输入两组欧拉角(单位为度，非弧度值)，例如：A1=[281.7 33.3 2.7]
disp('请输入欧拉角A1(φ1,Φ,φ2)');
A1=input('A1=');
disp('请输入欧拉角A2(φ1,Φ,φ2)');
A2=input('A2=');
a=A1(1);
b=A1(2);
c=A1(3);
d=A2(1);
e=A2(2);
f=A2(3);
%% 分别将两组欧拉角转化成取向矩阵g1和g2
g1=[cosd(a)*cosd(c)-sind(a)*sind(c)*cosd(b),sind(a)*cosd(c)+cosd(a)*sind(c)*cosd(b),sind(c)*sind(b);
    -cosd(a)*sind(c)-sind(a)*cosd(c)*cosd(b),-sind(a)*sind(c)+cosd(a)*cosd(c)*cosd(b),cosd(c)*sind(b);
    sind(a)*sind(b),-cosd(a)*sind(b),cosd(b)];
g2=[cosd(d)*cosd(f)-sind(d)*sind(f)*cosd(e),sind(d)*cosd(f)+cosd(d)*sind(f)*cosd(e),sind(f)*sind(e);
    -cosd(d)*sind(f)-sind(d)*cosd(f)*cosd(e),-sind(d)*sind(f)+cosd(d)*cosd(f)*cosd(e),cosd(f)*sind(e);
    sind(d)*sind(e),-cosd(d)*sind(e),cosd(e)];
%% 计算旋转矩阵A， 即g2乘以g1的逆矩阵。
A = g2/g1;
%% 对矩阵进行线性变换，使得其对角元素为其所在行和列的最大值。
[row,col] = size(A);
flag = 1;
while 1
[maxrow,maxcol] = find( A == max(max(A(flag:row,flag:col))) ); % 最大值坐标
maxrow = maxrow(end);
maxcol = maxcol(end); % 会有多个相同最大值的情况, 统一取最后一个
% 换行:
A([flag maxrow],:)=A([maxrow flag],:);
% 换列:
A(:,[flag maxcol])=A(:,[maxcol,flag]);
flag = flag + 1;
if flag > row-1
break;
end
end
A
%% 根据上步得到的旋转矩阵，得出旋转角和旋转轴
% 旋转角theta(单位为度，非弧度值)
B=A(1,1)+A(2,2)+A(3,3)-1;
theta=acosd(0.5*B)
% 旋转轴C
C=1/(2*sind(theta))*[A(3,2)-A(2,3),A(1,3)-A(3,1),A(2,1)-A(1,2)]





