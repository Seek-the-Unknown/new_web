// src/dao/RentalDAO.java
package dao;

import model.Rental;
import java.util.List;

public interface RentalDAO {
    void addRental(Rental rental);
    List<Rental> getAllRentals();
}