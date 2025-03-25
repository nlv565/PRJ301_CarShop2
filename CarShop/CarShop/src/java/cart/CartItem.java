/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import product.ProductDTO;

/**
 *
 * @author SHD
 */
public class CartItem {
     int cartDetailId;
     int cartId;
     ProductDTO product;
     int quantity;
    
    public CartItem() {
    }

    
    public CartItem(int cartDetailId, int cartId, ProductDTO product, int quantity) {
        this.cartDetailId = cartDetailId;
        this.cartId = cartId;
        this.product = product;
        this.quantity = quantity;
    }

    public CartItem(ProductDTO product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public int getCartDetailId() {
        return cartDetailId;
    }

    public void setCartDetailId(int cartDetailId) {
        this.cartDetailId = cartDetailId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
