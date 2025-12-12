-- functions 
/*
set of statements

-- scaler function --> row by row (result for each row )
multi line functions --> multiple line pr apply an give 1 output

scaler can apply on : date , int , float , string;
*/

-- string functions 

 -- 1. upper and lower function
 use world;
 select name , continent , upper(name), lower(name) from country;
 
 -- 2. concat function ( used to concat)
 select name , continent , concat(continent , '-', code ) from country;
 
 -- 3. concat_ws (concat with a seprater)
 select name , continent , concat_ws('-' , name , continent, 'regex') from country;
 
 -- 4. substr (substring) => character extract based on the position )
 select name , substr(name,3) , substr(name,2,5) from country; 
 
  -- ( 2 se start hokar 5 character layega ,  ) 
 select name , substr(name,2,5) from country; 

-- ( minus(-) string ke back se start karega ) 
select name , substr(name , -5) from country;
 
 -- (-5,3) pehle string ke back se -5 jayega fir -5 wali index se 3 character picche count karega )
 select name , substr(name , -5,3) from country;
 
 
 -- question
 select name , continent , substr(name,1,3)  from country where substr(name,1,3) = 'alg' ;
 
 -- 5 instr ( serarch from position of character )
 select name , instr(name ,'e' ) from country;
 
 -- 6. length() => ( kitna byte use hua us hisab se result dega);
 
 select length(' yash');
 
 -- char_length() => character count karega 
 select name , char_length(name) from country;
 
 -- 7. trim ( extra wide space ko hata dega )
 -- ltrim , rtrim ( ltrim left se or rtrim right se hatayega )
 
 select (    'yash.'    );
 select trim('       yash.    ');
 select char_length(trim('       yash.    '));
 
 select trim('    yaggshggggg    ');
 select trim( both 'g' from 'ggggyaggshggggg');
 
 -- dono side se Captial A hoga toh hata dega 
 select name, trim(both 'A' from name) from country;
 
 
 
 -- 8. lpad and rpad ( data ko fixed character length me convert karna )
 -- lpad character ke aage add karna start karega )
 select name , population , lpad(population , 9,'0') from country ;
 
 -- rpad ( character ke pichhe se add karega )
 select name ,population , rpad(population,9,'#') from country ;
 
 
 
 
 
 
 
 