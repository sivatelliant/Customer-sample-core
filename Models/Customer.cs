using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace Sample_Project.Models
{
    [Serializable]
    [DataContract]
    public class Customer
    {
        [DataMember]
        public string UserId { set; get; }
        [DataMember]
        public string FirstName { set; get; }
        [DataMember]
        public string LastName { set; get; }
        [DataMember]
        public string Email { set; get; }
        [DataMember]
        public string UserName { set; get; }
        [DataMember]
        public bool IsActive { set; get; }
        [DataMember]
        public DateTime CreatedOn { set; get; }
    }
}
