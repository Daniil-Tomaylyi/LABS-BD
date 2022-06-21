using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab6_bd
{
    internal class release
    {
        public int id_release { get; set; }
        public string? Name { get; set; }
        public string? Theme { get; set; }
        public int Id_broadcast { get; set; }
        public int Id_producer { get; set; }
        public string? broadcast { get; set; }
        public string? producer { get; set; }
        
    }
    internal class broadcast
    {
        public int id_broadcast { get; set; }
        public string? Name { get; set; }
   
        public string? Description { get; set; }
        public string? Year_of_creation { get; set; }
    }
}
