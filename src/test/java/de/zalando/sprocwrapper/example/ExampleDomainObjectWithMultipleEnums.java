package de.zalando.sprocwrapper.example;

import de.zalando.typemapper.annotations.DatabaseField;

public class ExampleDomainObjectWithMultipleEnums {


    @DatabaseField
    public ExampleEnum myEnum;

    public ExampleEnum getMyEnum() {
        return myEnum;
    }

    public void setMyEnum(final ExampleEnum myEnum) {
        this.myEnum = myEnum;
    }


    @DatabaseField
    public ExampleOtherEnum myOtherEnum;


    @DatabaseField
    public ExampleOtherEnum exampleOtherEnum;

    public ExampleOtherEnum getMyOtherEnum() {
        return myOtherEnum;
    }

    public void setMyOtherEnum(ExampleOtherEnum myOtherEnum) {
        this.myOtherEnum = myOtherEnum;
    }

    public ExampleOtherEnum getExampleOtherEnum() {
        return exampleOtherEnum;
    }

    public void setExampleOtherEnum(ExampleOtherEnum exampleOtherEnum) {
        this.exampleOtherEnum = exampleOtherEnum;
    }
}
