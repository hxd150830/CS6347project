function out_vector= readwekaout(path_to_file)
fid= fopen(path_to_file);
CA = textscan(fid, '%d %d %d %d %d %d %d %d');
fclose(fid);

formatSpec= '%f';
A = fscanf(fid,formatSpec);

A= readtable(path_to_file); 

A2= table2array(A);


[a b c d e f] = strread(A2(1));
end 