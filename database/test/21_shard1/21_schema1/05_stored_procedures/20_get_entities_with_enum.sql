CREATE OR REPLACE FUNCTION get_entities_with_enum(
    p_id bigint
)
RETURNS SETOF example_domain_object_with_multiple_enums AS
$BODY$
begin
    RETURN QUERY SELECT
                 'ENUM_CONST_1'::example_enum,
                 'ENUM_VAL1'::ztest_schema0.example_other_enum,
                 'ENUM_VAL2'::ztest_schema0.example_other_enum;
end;
$BODY$
LANGUAGE plpgsql VOLATILE COST 100;