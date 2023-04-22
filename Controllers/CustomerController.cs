using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sample_Project.Models;

namespace Sample_Project.Controllers
{
    public class CustomerController : Controller
    {
        CustomerDataAccessLayer customerDataAccessLayer = null;
        public CustomerController()
        {
            customerDataAccessLayer = new CustomerDataAccessLayer();
        }

        // GET: CustomerController
        public ActionResult Index()
        {
            IEnumerable<Customer> customer = customerDataAccessLayer.GetAllCustomer();
            return View(customer);
        }

        // GET: CustomerController/Details
        public List<Customer> Details(int userId)
        {
            List<Customer> lstCustomer = new List<Customer>();
            lstCustomer = customerDataAccessLayer.GetAllCustomer().ToList();

            return lstCustomer;
            
        }

        // GET: CustomerController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CustomerController/Create
        [HttpPost]
        public ActionResult Create(Customer customer)
        {
            try
            {
                customerDataAccessLayer.AddCustomer(customer);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        // GET: CustomerController/Edit
        public ActionResult Edit(string userId)
        {
            Customer customer = customerDataAccessLayer.GetCustomerData(userId);
            return View(customer);
        }

        // POST: CustomerController/Edit
        [HttpPost]
        public ActionResult Edit(string userId, Customer customer)
        {
            try
            {
                customerDataAccessLayer.UpdateCustomer(customer);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: CustomerController/Delete
        public ActionResult Delete(string userId)
        {
            Customer customer = customerDataAccessLayer.GetCustomerData(userId);
            return View(customer);
        }

        // POST: CustomerController/Delete
        [HttpPost]
        public ActionResult Delete(string userId, Customer customer)
        {
            try
            {
                customerDataAccessLayer.DeleteCustomer(customer.UserId);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        
        // GET: CustomerController/Active Orders
        public List<Customer> GetActiveOrders()
        {
            List<Customer> lstCustomer = new List<Customer>();
            lstCustomer = customerDataAccessLayer.GetActiveOrder().ToList();

            return lstCustomer;

        }
    }
}
