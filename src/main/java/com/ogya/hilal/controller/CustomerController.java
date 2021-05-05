package com.ogya.hilal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogya.hilal.model.Customer;
import com.ogya.hilal.repository.CustomerRepository;

import javax.validation.Valid;

@Controller
public class CustomerController {
    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("/list-customer")
    public String main(@RequestParam(required = false, defaultValue = "") String search,
                       Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Customer> customers;

        if (search != null && !search.isEmpty()) {
        	System.out.print("search: " + search);
            customers = customerRepository.findByName(search, pageable);
            System.out.print("customers: " + customers);
        } else {
            customers = customerRepository.findAll(pageable);
        }

        model.addAttribute("customers", customers);
        model.addAttribute("search", search);

        return "index";
    }


    @GetMapping("/add-customer")
    public String showSignUpForm(Customer customer) {
        return "operations/add-customer";
    }

    @PostMapping("/add-customer")
    public String addCustomer(@Valid Customer customer, BindingResult result, Model model, Pageable pageable) {
        if (result.hasErrors()) {
            return "operations/add-customer";
        }

        customerRepository.save(customer);
        model.addAttribute("customers", customerRepository.findAll(pageable));
        return "redirect:/list-customer";

    }

    // additional CRUD methods
    @GetMapping("/edit-customer/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));

        model.addAttribute("customer", customer);
        return "operations/update-customer";
    }

    @PostMapping("/update-customer/{id}")
    public String updateUser(@PathVariable("id") long id, @Valid Customer customer,
                             BindingResult result, Model model, Pageable pageable) {
        if (result.hasErrors()) {
            customer.setId(id);
            return "operations/update-customer";
        }

        customerRepository.save(customer);
        model.addAttribute("customers", customerRepository.findAll(pageable));
        return "redirect:/list-customer";
    }

    @GetMapping("/delete-customer/{id}")
    public String deleteUser(@PathVariable("id") long id, Model model, Pageable pageable) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        customerRepository.delete(customer);
        model.addAttribute("customers", customerRepository.findAll(pageable));
        return "redirect:/list-customer";
    }

    @GetMapping("/filter")
    public String filterCustomers(@RequestParam(value = "filter", required = false, defaultValue = "") String filterNeeded,
                            Model model,
                            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Customer> customers;

        if (filterNeeded.equals("")) {
            customers = customerRepository.findAll(pageable);
        } else if (filterNeeded.equals("true")) {
            customers = customerRepository.findByGender(true, pageable);
        } else {
            customers = customerRepository.findByGender(false, pageable);
        }

        model.addAttribute("customers", customers);
        model.addAttribute("filterNeeded", filterNeeded);

        return "index";
    }
}
