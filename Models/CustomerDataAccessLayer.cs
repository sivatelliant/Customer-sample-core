using Sample_Project.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Sample_Project.Models
{
    public class CustomerDataAccessLayer
    {
        string connectionString = ConnectionString.ConnStr;

        public IEnumerable<Customer> GetAllCustomer()
        {
            List<Customer> lstustomer = new List<Customer>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetAllCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Customer customer = new Customer();
                    customer.UserId = rdr["UserId"].ToString();
                    customer.FirstName = rdr["FirstName"].ToString();
                    customer.LastName = rdr["LastName"].ToString();
                    customer.Email = rdr["Email"].ToString();
                    customer.UserName = rdr["UserName"].ToString();
                    customer.IsActive = rdr["IsActive"] != DBNull.Value && (bool)rdr["IsActive"];
                    customer.CreatedOn = Convert.ToDateTime(rdr["CreatedOn"]);

                    lstustomer.Add(customer);
                }
                con.Close();
            }
            return lstustomer;
        }
        public void AddCustomer(Customer customer)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName", customer.FirstName);
                cmd.Parameters.AddWithValue("@LastName", customer.LastName);
                cmd.Parameters.AddWithValue("@Email", customer.Email);
                cmd.Parameters.AddWithValue("@UserName", customer.UserName);
                cmd.Parameters.AddWithValue("@CreatedOn", customer.CreatedOn);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public void UpdateCustomer(Customer customer)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spUpdateCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserId", customer.UserId);
                cmd.Parameters.AddWithValue("@FirstName", customer.FirstName);
                cmd.Parameters.AddWithValue("@LastName", customer.LastName);
                cmd.Parameters.AddWithValue("@Email", customer.Email);
                cmd.Parameters.AddWithValue("@UserName", customer.UserName);
                cmd.Parameters.AddWithValue("@IsActive", customer.IsActive);
                cmd.Parameters.AddWithValue("@CreatedOn", customer.CreatedOn);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public Customer GetCustomerData(string userId)
        {
            Customer customer = new Customer();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT * FROM CUSTOMER WHERE UserId= " + userId;
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    customer.UserId = rdr["UserId"].ToString(); 
                    customer.FirstName = rdr["FirstName"].ToString();
                    customer.LastName = rdr["LastName"].ToString();
                    customer.Email = rdr["Email"].ToString();
                    customer.UserName = rdr["UserName"].ToString();
                    customer.IsActive = rdr["IsActive"] != DBNull.Value && (bool)rdr["IsActive"];
                    customer.CreatedOn = Convert.ToDateTime(rdr["CreatedOn"]);
                }
            }
            return customer;
        }

        public void DeleteCustomer(string userId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", userId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public IEnumerable<Customer> GetActiveOrder()
        {
            List<Customer> lstustomer = new List<Customer>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetActiveOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Customer customer = new Customer();
                    customer.UserId = rdr["UserId"].ToString();
                    customer.FirstName = rdr["FirstName"].ToString();
                    customer.LastName = rdr["LastName"].ToString();
                    customer.Email = rdr["Email"].ToString();
                    customer.UserName = rdr["UserName"].ToString();
                    customer.IsActive = rdr["IsActive"] != DBNull.Value && (bool)rdr["IsActive"];
                    customer.CreatedOn = Convert.ToDateTime(rdr["CreatedOn"]);

                    lstustomer.Add(customer);
                }
                con.Close();
            }
            return lstustomer;
        }
    }
}
