package edu.skku.wpl2021f;

import lombok.Getter;

@Getter
public class TestObject {

    private String name;
    private int age;

    public TestObject(String name, int age) {
        this.name = name;
        this.age = age;
    }

}
