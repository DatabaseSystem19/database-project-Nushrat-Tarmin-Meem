--array and loop
set serveroutput on
declare
   counter number := 1;
   d_name doctor.doctor_name%type;
   type namearray is varray(11) of doctor.doctor_name%type;
   a_name namearray:=namearray('D1', 'D2', 'D3', 'D4', 'D5', 'D6','D7','D8','D9', 'D10','D11'); 
begin
   counter := 1;
   for x in 1..11  
   loop
      select doctor_name into d_name from doctor where doctor_id=x;
      a_name(counter) := d_name;
      counter := counter + 1;
   end loop;
   counter := 1;
   while counter <= a_name.count
   loop
      dbms_output.put_line('Name:' || a_name(counter)); 
      counter := counter + 1;
   end loop;
end;
/




--if elseif
set serveroutput on
declare
   counter number := 1;
   d_name doctor.doctor_name%type;
   d_category doctor.category%type;
begin
   counter := 1;
   for x in 1..11  
   loop
      select doctor_name into d_name from doctor where doctor_id=x;
      select category into d_category from doctor where doctor_id=x;
      if d_category='Cardiologist'
       then
	dbms_output.put_line(d_name||' is a '||'Cardiologist');
      elsif d_category='Neurologist'
	then
	dbms_output.put_line(d_name||' is a '||'Neurologist');
	else
        dbms_output.put_line(d_name||' is a '||'Specialist');
	end if;
	counter := counter + 1;
   end loop;
end;
/



--function
set serveroutput on
create function fun(id in varchar) return varchar AS
value doctor.doctor_name%type;
begin
  select doctor_name into value from doctor where doctor_id = id; 
   return value;
end;
/

set serveroutput on
declare 
name varchar(20);
begin
name:=fun(5);
dbms_output.put_line('D_Name of id 5: ' || name);
end;
/
drop function fun;
