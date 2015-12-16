CREATE OR REPLACE FUNCTION use_enum_param_in_different_schema(
    IN p_param ztest_schema0.example_other_enum,
    IN p_param2 int[]
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
LANGUAGE plpgsql VOLATILE SECURITY DEFINER COST 100;
