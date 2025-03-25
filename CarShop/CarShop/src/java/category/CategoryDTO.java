/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package category;

import java.io.Serializable;

/**
 *
 * @author ADMIN-PC
 */
public class CategoryDTO implements Serializable {

    private int id;
    private String icon;
    private String name;

    public CategoryDTO() {
    }

    public CategoryDTO(int id, String name, String icon) {
        this.id = id;
        this.icon = icon;
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "id=" + id + ", name=" + name + '}';
    }

}
