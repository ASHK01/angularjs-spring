package com.jeejava.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.stereotype.Service;

import com.jeejava.dto.Product;

@Service
public class ProductServiceImpl implements ProductService {

	private static AtomicInteger counter = new AtomicInteger();

	private static List<Product> products;

	static {
		products = populateProducts();
	}

	@Override
	public Product findProductById(int id) {
		for (Product product : products) {
			if (id == product.getId()) {
				return product;
			}
		}
		return null;
	}

	@Override
	public Product findProductByName(String name) {
		for (Product product : products) {
			if (name.equalsIgnoreCase(product.getName())) {
				return product;
			}
		}
		return null;
	}

	@Override
	public void saveProduct(Product product) {
		product.setId(counter.incrementAndGet());
		products.add(product);
	}

	@Override
	public void updateProduct(Product product) {
		int index = products.indexOf(product);
		products.set(index, product);
	}

	@Override
	public void deleteProductById(int id) {
		Iterator<Product> it = products.iterator();
		while (it.hasNext()) {
			Product product = it.next();
			if (id == product.getId()) {
				it.remove();
			}
		}
	}

	@Override
	public List<Product> findAllProducts() {
		return products;
	}

	@Override
	public void deleteAllProducts() {
		products.clear();
	}

	@Override
	public boolean isProductAvailable(Product product) {
		return findProductById(product.getId()) != null || findProductByName(product.getName()) != null;
	}

	private static List<Product> populateProducts() {
		List<Product> products = new ArrayList<Product>();
		products.add(new Product(counter.incrementAndGet(), "Mobile", 25498.00, "google", "WIP", "Usability"));
		products.add(new Product(counter.incrementAndGet(), "Desktop", 32658.00, "google", "WIP", "Usability"));
		products.add(new Product(counter.incrementAndGet(), "Laptop", 52147.00,"google", "WIP", "Usability"));
		products.add(new Product(counter.incrementAndGet(), "Tab", 18254.00, "google", "WIP", "Usability"));
		return products;
	}

}
