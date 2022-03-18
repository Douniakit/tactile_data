clear all; close all; clc



% THUMB_MASK {/*tip 0*/ 1, 2, 3, 4, 5, 6, 7, 8, 9, 18, 19, 20, 21, 22, 23, 32, 33, 34, 35, 36, 37, 46, 47, 48, 49, 50, 59, 60, 61, 62,
%             /*square 1*/10, 11, 12, 13, 24, 25, 26, 27, 38, 39, 40, 41, 51, 52, 53, 54,
%             /*square 2*/14, 15, 16, 17, 28, 29, 30, 31, 42, 43, 44, 45, 55, 56, 57, 58}
% 
% FINGER_1_MASK {/*tip 1*/63, 64, 65, 66, 67, 68, 69, 70, 71, 84, 85, 86, 87, 88, 89, 102, 103, 104, 105, 106, 107, 124, 125, 126, 127, 128, 145, 146, 147, 148,
%                /*square 1*/72, 73, 74, 75, 90, 91, 92, 93, 108, 109, 110, 111, 129, 130, 131, 132,
%                /*square 2*/76, 77, 78, 79, 94, 95, 96, 97, 112, 113, 114, 115, 133, 134, 135, 136,
%                /*square 3*/80, 81, 82, 83, 98, 99, 100, 101, 116, 117, 118, 119, 137, 138, 139, 140}
% 
% FINGER_2_MASK {/*tip 2*/157, 158, 159, 160, 165, 166, 167, 168, 169, 186, 187, 188, 189, 190, 191, 204, 205, 206, 207, 208, 209, 222, 223, 224, 225, 226, 247, 248, 249, 250,
%                /*square 1*/170, 171, 172, 173, 192, 193, 194, 195, 210, 211, 212, 213, 227, 228, 229, 230,
%                /*square 2*/174, 175, 176, 177, 196, 197, 198, 199, 214, 215, 216, 217, 231, 232, 233, 234,
%                /*square 3*/ 178, 179, 180, 181, 200, 201, 202, 203, 218, 219, 220, 221, 235, 236, 237, 238}
% 
% FINGER_3_MASK {/*tip 3*/267, 268, 269, 270, 279, 280, 281, 282, 283, 304, 305, 306, 307, 308, 309, 330, 331, 332, 333, 334, 335, 348, 349, 350, 351, 352, 365, 366, 367, 368,
%                /*square 1*/284, 285, 286, 287, 310, 311, 312, 313, 336, 337, 338, 339, 353, 354, 355, 356,
%                /*square 2*/288, 289, 290, 291, 314, 315, 316, 317, 340, 341, 342, 343, 357, 358, 359, 360,
%                /*square 3*/292, 293, 294, 295, 318, 319, 320, 321, 344, 345, 346, 347, 361, 362, 363, 364}
% 
% PALM_MASK {/*palm 0*/120, 121, 122, 123, 141, 142, 143, 144, 149, 150, 151, 152, 153, 154, 155, 156, 161, 162, 163, 164, 182, 183, 184, 185,
%            /*palm 1*/ 239, 240, 241, 242, 251, 252, 253, 254, 259, 260, 261, 262, 271, 272, 273, 274, 296, 297, 298, 299, 322, 323, 324, 325,
%            /*palm 2*/243, 244, 245, 246, 255, 256, 257, 258, 263, 264, 265, 266, 275, 276, 277, 278, 300, 301, 302, 303, 326, 327, 328, 329}




%  names no_ctc_i.csv sens_ctc_si.csv sens_ctc_ii.csv 
%  sens = 4x4 4x6 tip

id_4x4=[10, 11, 12, 13, 24, 25, 26, 27, 38, 39, 40, 41, 51, 52, 53, 54]';
id_4x6=[120, 121, 122, 123, 141, 142, 143, 144, 149, 150, 151, 152, 153, 154, 155, 156, 161, 162, 163, 164, 182, 183, 184, 185]';
id_tip=[63, 64, 65, 66, 67, 68, 69, 70, 71, 84, 85, 86, 87, 88, 89, 102, 103, 104, 105, 106, 107, 124, 125, 126, 127, 128, 145, 146, 147, 148]';

%% no contact

no_ctc0= readtable('data/no_ctc_0.csv','NumHeaderLines',1);
no_ctc0=table2array(no_ctc0);
t_no_ctc0=no_ctc0(:,1);
t_no_ctc0=t_no_ctc0-t_no_ctc0(1);

fi_no_ctc_4x4_0=[];
for i=1:length(id_4x4)
        fi_no_ctc_4x4_0=[fi_no_ctc_4x4_0 no_ctc0(:,(id_4x4(i))*3-1:(id_4x4(i))*3+1)];
end

offsets=mean(fi_no_ctc_4x4_0);

% figure,
% title('no contact')
% for i=1:16
%     
% Fx=fi_no_ctc_4x4_0(:,(i-1)*3+1);
% Fy=fi_no_ctc_4x4_0(:,(i-1)*3+2);
% Fz=fi_no_ctc_4x4_0(:,(i-1)*3+3);
% F=sqrt(Fx.^2+Fy.^2+Fz.^2);
% 
% 
% subplot(4,1,1),plot(t_no_ctc0,Fx),xlabel('t'),ylabel('Fx')
% subplot(4,1,2),plot(t_no_ctc0,Fy),xlabel('t'),ylabel('Fy')
% subplot(4,1,3),plot(t_no_ctc0,Fz),xlabel('t'),ylabel('Fz')
% subplot(4,1,4),plot(t_no_ctc0,F),xlabel('t'),ylabel('F')
% hold on
% end
% hold off
%% stable contact 

ctc_s0= readtable('data/4x4_ctc_s0.csv','NumHeaderLines',1);
ctc_s0=table2array(ctc_s0);
ctc_s0=ctc_s0(1000:end,:);
t_ctc_s0=ctc_s0(:,1);
t_ctc_s0=t_ctc_s0-t_ctc_s0(1);

fi_ctc_4x4_s0=[];
for i=1:length(id_4x4)
        fi_ctc_4x4_s0=[fi_ctc_4x4_s0 ctc_s0(:,(id_4x4(i))*3-1:(id_4x4(i))*3+1)];
end
for i=1:48    
fi_ctc_4x4_s0(:,i)=fi_ctc_4x4_s0(:,i)-offsets(i);
end

figure,
title('stable contact')
for i=1:16
    
Fx=fi_ctc_4x4_s0(:,(i-1)*3+1);
%im_fx=reshape(Fx,
Fy=fi_ctc_4x4_s0(:,(i-1)*3+2);
Fz=fi_ctc_4x4_s0(:,(i-1)*3+3);
F=sqrt(Fx.^2+Fy.^2+Fz.^2);
F_d=F(2:end)-F(1:end-1);


subplot(5,1,1),plot(t_ctc_s0,Fx,'.'),xlabel('t'),ylabel('Fx'),hold on
subplot(5,1,2),plot(t_ctc_s0,Fy,'.'),xlabel('t'),ylabel('Fy'),hold on
subplot(5,1,3),plot(t_ctc_s0,Fz,'.'),xlabel('t'),ylabel('Fz'),hold on
subplot(5,1,4),plot(t_ctc_s0,F,'.'),xlabel('t'),ylabel('F'),hold on
subplot(5,1,5),plot(t_ctc_s0(2:end),F_d,'.'),xlabel('t'),ylabel('F_d'),hold on
end
hold off

%% instable contact 

ctc_i0= readtable('data/4x4_ctc_i2.csv','NumHeaderLines',1);
ctc_i0=table2array(ctc_i0);
ctc_i0=ctc_i0(1000:end,:);
t_ctc_i0=ctc_i0(:,1);
t_ctc_i0=t_ctc_i0-t_ctc_i0(1);

fi_ctc_4x4_i0=[];
for i=1:length(id_4x4)
        fi_ctc_4x4_i0=[fi_ctc_4x4_i0 ctc_i0(:,(id_4x4(i))*3-1:(id_4x4(i))*3+1)];
end
for i=1:48    
fi_ctc_4x4_i0(:,i)=fi_ctc_4x4_i0(:,i)-offsets(i);
end

figure,
title('stable contact')
for i=1:16
    
Fx=fi_ctc_4x4_i0(:,(i-1)*3+1);
Fy=fi_ctc_4x4_i0(:,(i-1)*3+2);
Fz=fi_ctc_4x4_i0(:,(i-1)*3+3);
F=sqrt(Fx.^2+Fy.^2+Fz.^2);
F_d=F(2:end)-F(1:end-1);


subplot(5,1,1),plot(t_ctc_i0,Fx,'.'),xlabel('t'),ylabel('Fx'),hold on
subplot(5,1,2),plot(t_ctc_i0,Fy,'.'),xlabel('t'),ylabel('Fy'),hold on
subplot(5,1,3),plot(t_ctc_i0,Fz,'.'),xlabel('t'),ylabel('Fz'),hold on
subplot(5,1,4),plot(t_ctc_i0,F,'.'),xlabel('t'),ylabel('F'),hold on

subplot(5,1,5),plot(t_ctc_i0(2:end),F_d,'.'),xlabel('t'),ylabel('F_d'),hold on
 
end
hold off