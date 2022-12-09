package com.example.springsecurityapplication.models;

import jdk.jfr.Registered;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.List;

// 4. Связывает модель с таблицей базы данных
@Entity
@Table(name = "Person")
public class Person {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty(message = "The login cannot be empty")
    @Size(min = 5, max = 100, message = "The login must be from 5 to 100 characters")
    @Column(name = "login")
    private String login;

    @NotEmpty(message = "The login cannot be empty")
    @Size(min = 5, max = 100, message = "The password must be from 5 to 100 characters")
    @Column(name = "password")
    private String password;

    @Column(name = "role")
    private String role;

    @ManyToMany()
    @JoinTable(name = "product_cart", joinColumns = @JoinColumn(name = "person_id"), inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> product;

    @OneToMany(mappedBy = "person")
    private List<Order> orderList;
    public Person() {


    }

    public Person(int id, String login, String password) {
        this.id = id;
        this.login = login;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
