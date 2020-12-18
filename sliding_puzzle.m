function slidine_puzzle

R = imread('game_method.jpg');
button = 0;
%%��ܹC���覡
while ~button
    image(R);
    [x y button] = ginput(1); 
end

while 1
    disp('��ܤ@�ӹϤ��i��C���ΰh�X�A�I�����D�i�ݨ�C���覡');
%%ø�s�C���ʭ�
Q = imread('quit.jpg');
Q = Q(20:200,:,:);
G = imread('gleaner.jpg');
H = imread('taiwan.jpg');
J = imread('london.jpg');
TT = imread('title.png');
%T(1:125,1:740,1:3) = 1;
T(1:125,1:370,1:3) = TT(1:125,1:370,1:3);
T(1:125,371:740,1:3) = TT(126:250,131:500,1:3);
Z(1:length(T(:,1)),1:length(T),:) = T(:,:,:);
Z(length(T(:,1))+1:length(T(:,1))+length(G(:,1)),1:length(G),1:3) = G(1:length(G(:,1)),1:length(G),1:3);
Z(length(T(:,1))+1:length(T(:,1))+length(Q(:,1)),551:550+length(Q),:) = Q;
Z(length(T(:,1))+length(G(:,1))+1:length(T(:,1))+length(G(:,1))+ length(H(:,1)),1:length(H),1:3) = H(1:length(H(:,1)),1:length(H),1:3);
Z(length(T(:,1))+length(G(:,1))+ length(H(:,1))+1:length(T(:,1))+length(G(:,1))+ length(H(:,1))+length(J(:,1)),1:length(J),1:3) = J(1:length(J(:,1)),1:length(J),1:3);
image(Z);   %��ܹC���ʭ�

check = 1;
while check ~= 0
    [x y button] = ginput(1);
    %�ϥΪ̮�title
    %check = 0 �N����X�j��
    if y <= length(T(:,1)) || check == 2
        if check == 1
            image(R);   %��ܹC���W�h
            check = 2;
        elseif check == 2
            image(Z);   %�^��C���ʭ�
            check = 1;
        else
            return;
        end
    elseif y>length(T(:,1))&y<=length(T(:,1))+length(G(:,1)) & x <= 550
        %��ܲĤ@�ӹ�
        check = 0;
        X = G;
    elseif y>length(T(:,1))+length(G(:,1))&y<=length(T(:,1))+length(G(:,1))+ length(H(:,1))
        %��ܲĤG�ӹ�
        check = 0;
        X = H;
    elseif y>length(T(:,1))+length(G(:,1))+ length(H(:,1))
        %��ܲĤT�ӹ�
        check = 0;
        X = J;
    elseif y>length(T(:,1))&y<=length(T(:,1))+length(Q(:,1)) & x > 550
        %�ϥΪ̰h�X
        TH = imread('thank_you.jpg');
        image(TH);
        return;
    end
end

%%���������
D = imread('level.jpg');
image(D);

[x y button] = ginput(1);
level = 0;
while ~level
    if(y>=60&&y<=175&&x>=250&&x<=605)%60-175&250-605
        level = 3;
        max = 50;

    elseif(y>=185&&y<=300&&x>=250&&x<=605)%185-300&250-605
        level = 4;
        max = 50;

    elseif(y>=305&&y<=420&&x>=250&&x<=605)%305-420%250-605
        level = 5;
        max = 70;
    else
        [x y button] = ginput(1);
    end
end

%%�N�Ϥ���23*4*5=60������
len_x = 60*(floor(length(X)/60));
len_y = 60*(floor(length(X(:,1))/60));
A = X(1:len_y,1:len_x,:);
x_divide_3 = len_x/level;
y_divide_3 = len_y/level;
%�ťճB���k�U��
A(len_y - y_divide_3 + 1:len_y,len_x - x_divide_3 + 1:len_x,:) = 1;
B = A;
image(A);
%%�ťճB��l��
blank_x = len_x - x_divide_3 + 1;   
blank_y = len_y - y_divide_3 + 1;

step = 0;
t = 0;

%%�N��ϧ˶�
while t < max
    r = rand(1);
    if(r<0.25)
        button = 28;
    elseif(r>=0.25&r<0.5)
        button = 29;
    elseif(r>=0.5&r<0.75)
        button = 30;
    else
        button = 31;
    end
    if button == 29 %right
        if blank_x - x_divide_3 > 0
            A(blank_y:blank_y + y_divide_3 - 1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y:blank_y + y_divide_3 - 1,blank_x-x_divide_3:blank_x-1,:);
            A(blank_y:blank_y + y_divide_3 - 1,blank_x-x_divide_3:blank_x-1,:) = 1;
        blank_x = blank_x - x_divide_3;
        end
    elseif button == 28 %left
        if blank_x + x_divide_3 < len_x
            A(blank_y:blank_y + y_divide_3 - 1,blank_x:blank_x+x_divide_3-1,:) = A(blank_y:blank_y + y_divide_3 - 1,blank_x+x_divide_3:blank_x+2*x_divide_3-1,:);
            A(blank_y:blank_y + y_divide_3 - 1,blank_x+x_divide_3:blank_x+2*x_divide_3-1,:) = 1;
        blank_x = blank_x + x_divide_3;
        end
    elseif button == 31 %down
        if blank_y - y_divide_3 > 0
            A(blank_y:blank_y+y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y-y_divide_3:blank_y-1,blank_x:blank_x + x_divide_3 - 1,:);
            A(blank_y-y_divide_3:blank_y-1,blank_x:blank_x + x_divide_3 - 1,:) = 1;
        blank_y = blank_y - y_divide_3;
        end    
    elseif button == 30 %up
        if blank_y + y_divide_3 < len_y
            A(blank_y:blank_y+y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y+y_divide_3:blank_y+2*y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:);
            A(blank_y+y_divide_3:blank_y+2*y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = 1;
        blank_y = blank_y + y_divide_3;
        end    
    end
    t = t + 1;
end


tic
show_graph = 1;
show_rule = 1;
[x y button] = ginput(1);

while 1
    %�h�X
    if isempty(button)
        break;
    end
if button == 29 %right
    if blank_x - x_divide_3 > 0
        A(blank_y:blank_y + y_divide_3 - 1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y:blank_y + y_divide_3 - 1,blank_x-x_divide_3:blank_x-1,:);
        A(blank_y:blank_y + y_divide_3 - 1,blank_x-x_divide_3:blank_x-1,:) = 1;
        blank_x = blank_x - x_divide_3;
        image(A);
    end
elseif button == 28 %left
    if blank_x + x_divide_3 < len_x
        A(blank_y:blank_y + y_divide_3 - 1,blank_x:blank_x+x_divide_3-1,:) = A(blank_y:blank_y + y_divide_3 - 1,blank_x+x_divide_3:blank_x+2*x_divide_3-1,:);
        A(blank_y:blank_y + y_divide_3 - 1,blank_x+x_divide_3:blank_x+2*x_divide_3-1,:) = 1;
        image(A);
        blank_x = blank_x + x_divide_3;
    end
elseif button == 31 %down
    if blank_y - y_divide_3 > 0
        A(blank_y:blank_y+y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y-y_divide_3:blank_y-1,blank_x:blank_x + x_divide_3 - 1,:);
        A(blank_y-y_divide_3:blank_y-1,blank_x:blank_x + x_divide_3 - 1,:) = 1;
        image(A);
        blank_y = blank_y - y_divide_3;
    end    
elseif button == 30 %up
    if blank_y + y_divide_3 < len_y
        A(blank_y:blank_y+y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y+y_divide_3:blank_y+2*y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:);
        A(blank_y+y_divide_3:blank_y+2*y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = 1;
        image(A);
        blank_y = blank_y + y_divide_3;
    end
elseif button == 83 || button == 115     %show the original graph
    if show_graph == 1
        image(B);
        show_graph = 0;
    else
        image(A);
        show_graph = 1;
    end
elseif button == 114 || button == 82
    if show_rule == 1;
        image(R);
        show_rule = 0;
    else
        image(A);
        show_rule = 1;
    end
else    %�ηƹ���J
    %down
    if x >= blank_x & x < blank_x + x_divide_3 & y < blank_y & y >= blank_y - y_divide_3
         A(blank_y:blank_y+y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y-y_divide_3:blank_y-1,blank_x:blank_x + x_divide_3 - 1,:);
            A(blank_y-y_divide_3:blank_y-1,blank_x:blank_x + x_divide_3 - 1,:) = 1;
            image(A);
        blank_y = blank_y - y_divide_3;
    %right
    elseif x < blank_x & x >= blank_x - x_divide_3 & y >= blank_y & y < blank_y + y_divide_3
            A(blank_y:blank_y + y_divide_3 - 1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y:blank_y + y_divide_3 - 1,blank_x-x_divide_3:blank_x-1,:);
            A(blank_y:blank_y + y_divide_3 - 1,blank_x-x_divide_3:blank_x-1,:) = 1;

        blank_x = blank_x - x_divide_3;
        image(A);
    %left
    elseif x >= blank_x + x_divide_3 & x <blank_x + 2*x_divide_3 & y >= blank_y & y < blank_y + y_divide_3
       A(blank_y:blank_y + y_divide_3 - 1,blank_x:blank_x+x_divide_3-1,:) = A(blank_y:blank_y + y_divide_3 - 1,blank_x+x_divide_3:blank_x+2*x_divide_3-1,:);
            A(blank_y:blank_y + y_divide_3 - 1,blank_x+x_divide_3:blank_x+2*x_divide_3-1,:) = 1;
            image(A);
        blank_x = blank_x + x_divide_3;
    %up
    elseif x>=blank_x & x<blank_x + x_divide_3 & y >= blank_y + y_divide_3 & y<blank_y+2*y_divide_3
         A(blank_y:blank_y+y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = A(blank_y+y_divide_3:blank_y+2*y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:);
            A(blank_y+y_divide_3:blank_y+2*y_divide_3-1,blank_x:blank_x + x_divide_3 - 1,:) = 1;
            image(A);
        blank_y = blank_y + y_divide_3;
    else
        image(A);
    end
end
step = step + 1;

if B == A
    P = imread('perfect.jpg');
    pause(1);
    image(P);
    pause(2);
    break;
end
[x y button] = ginput(1);

end
step = step - 1;
disp(['�z�`�@��F', num2str(step), '�B'])
time_cost = toc;
time_cost = floor(time_cost);
disp(['�z�`�@��F', num2str(time_cost), '��'])
disp(' ');
end     

%
end