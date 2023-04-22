using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample_Project.Utility
{
    public static class ConnectionString
    {
        private static string connStr = "Data Source= ;Initial Catalog= ;Persist Security Info=True;User ID=cr-dev;Password=";

        public static string ConnStr { get => connStr; }
    }
}
