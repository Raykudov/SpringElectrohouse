package com.example.springsecurityapplication.enumm;

public enum Status {
    Принят, ОФормлен, Оплачен,  Ожидает, Получен;

    @Override
    public String toString() {
        return "Status{} " ;
    }
}
