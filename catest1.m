function[CA_sol] = catest1();

satnum = input("enter satellite number: "); %enter the satellite number
delay1 = input("enter delay: "); %enter delay from the table
initial_register = -1* ones(1,10);% shift register initial values

%generation of G1 register
for i = 1:1023;
    G1(i) = initial_register(10); %assigning final output to register
    %designing G1 block diagram
    equ1 = initial_register(3)* initial_register(10);
    initial_register(1, 2:10) = initial_register(1:1:9);
    initial_register(1) = equ1;
    
end

%generation of G2 register
for i = 1:1023;
    G2(i) = initial_register(10); %assigning final output of register
    %designing G2 register from block diagram 
    equ2 = initial_register(2)*initial_register(3)*initial_register(6)*initial_register(8)*initial_register(9)*initial_register(10);
    initial_register(1,2:10) = initial_register(1:1:9);
    initial_register(1) = equ2; 
end

%Shifting of G2 code 
temp(1, 1:delay1) = G2(1,1023-delay1+1:1023);
temp(1,delay1+1:1023) = G2(1,1:1023-delay1);

G2 = temp; % Assigning shifted code to G2
CA_sol = G1.*G2; % multiplying code wise with G1 


end