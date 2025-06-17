package com.benjamin.springboot.app.repositories;

import com.benjamin.springboot.app.models.entity.Pago;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface PagoRepository extends MongoRepository<Pago, String> {
}
