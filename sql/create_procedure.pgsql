-- FUNCTION: public.get_address()

-- DROP FUNCTION public.get_address();

CREATE OR REPLACE FUNCTION public.get_address(
	)
    RETURNS TABLE(states text, district text, city text) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN
return query select 
s.states_name,
d.district_name,
c.city_name
from
statics.states as s
left join
statics.districts as d
on 
s.statesid = d.statesid
left join
statics.city as c
on
c.districtid = d.districtid;
END; $BODY$;

ALTER FUNCTION public.get_address()
    OWNER TO postgres;
-- FUNCTION: public.get_address()

-- DROP FUNCTION public.get_address();

CREATE OR REPLACE FUNCTION public.get_address(
	)
    RETURNS TABLE(states text, district text, city text) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN
return query select 
s.states_name,
d.district_name,
c.city_name
from
statics.states as s
left join
statics.districts as d
on 
s.statesid = d.statesid
left join
statics.city as c
on
c.districtid = d.districtid;
END; $BODY$;

ALTER FUNCTION public.get_address()
    OWNER TO postgres;
