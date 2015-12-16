CREATE OR REPLACE FUNCTION test_simple_transformer_list()
RETURNS SETOF example_domain_object_with_simple_transformer AS
$$
BEGIN
  RETURN QUERY
      SELECT '123'::text,
             'hallo'::text;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;