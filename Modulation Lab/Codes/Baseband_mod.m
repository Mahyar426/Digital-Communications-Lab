function [B,A] = Baseband_mod (bit_stream, Mod_Type,k)

 bit_length=length(bit_stream);

 switch Mod_Type
    
    
    case 'OOK'
        A=zeros(1,bit_length);
        B=bit_stream;
        % since we map 0 & 1 to 0 & 1 respectively,imaginary part is zero
        % and real part is bit stream which user selected
        
        
    case 'PSK'
        eq_matrix=reshape(bit_stream,[k,bit_length/k])';
        
        % The above line converts bit_stream(which is a vector) to a matrix
        % with bit_length/k rows and k columns
        
        n=bi2de(eq_matrix,2,'left-msb')';
        
        % then eq_matrix is used to form n which is a set of numbers
        % corresponding to our data
        % for example : k=2 , bit_stream=[0 1 1 0 0 0 1 1];
        % then n is [1 2 0 3] which shows 01 is 1 and 10 is 2 and 00 is 0
        % and 11 is 3
        
        B = real(pskmod(n,2^k));       
        A = imag(pskmod(n,2^k));
        % as it is described in the documentation,pskmod(n,2^k) returns psk
        % modulation of n with order of 2^k
        
    case 'ASK'
        eq_matrix=reshape(bit_stream,[k,bit_length/k])';
        n=bi2de(eq_matrix,2,'left-msb')';   %it is explained above in PSK
        B = n+1;
        A = zeros(1,bit_length/k);
        % we map input bit stream to its decimal value
        
        
    case 'QAM'       
        eq_matrix=reshape(bit_stream,[k,bit_length/k])';
        n=bi2de(eq_matrix,2,'left-msb')';   %it is explained above in PSK
        B = real(qammod(n,2^k));       
        A = imag(qammod(n,2^k));
        % like psk,we use MATLAB function for modulating qam modulation
 end
end
