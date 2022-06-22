
using MySql.Data.MySqlClient;

namespace lab6_bd
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            name_tables.SelectedIndex=0;
        }
      
        private void Delete_button_Click(object sender, EventArgs e)
        {
            if (name_tables.SelectedIndex == 0)
            {
                
                DB db = new DB();
                release release = new release();
                release.id_release = int.Parse(dataGridView1.CurrentRow.Cells[0].Value.ToString());
                string commandText = "delete from `release` where idrelease=@release.id_release";
                db.openConnection(); // открыть соединение
                using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());
                MySqlParameter Deleterelease = new MySqlParameter("@release.id_release", release.id_release);
                Command.Parameters.Add(Deleterelease);

                if (Command.ExecuteNonQuery() != 1) {
                        MessageBox.Show("Ошибка заполнения", "Ошибка");
                }
                else
                {
                    MessageBox.Show("Данные удалены", "Успех");
                    Command.ExecuteNonQuery(); // выполнить запрос
                    dataGridView1.Rows.RemoveAt(dataGridView1.CurrentRow.Index);
                }
                db.closeConnection();
                

            }
            else
            {
                broadcast broadcast = new broadcast();
                broadcast.id_broadcast = int.Parse(dataGridView1.CurrentRow.Cells[0].Value.ToString());
                DB db = new DB();                
                string commandText = "delete from broadcast where id_broadcast=@broadcast.id_broadcast";
                db.openConnection(); // открыть соединение
                using  MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());
                MySqlParameter Deletebroadcast = new MySqlParameter("@broadcast.id_broadcast", broadcast.id_broadcast);
                Command.Parameters.Add(Deletebroadcast);
                
                if (Command.ExecuteNonQuery() != 1) { 
                    MessageBox.Show("Ошибка заполнения", "Ошибка");
                }
                else
                {
                    MessageBox.Show("Данные удалены", "Успех");
                    Command.ExecuteNonQuery(); // выполнить запрос
                    dataGridView1.Rows.RemoveAt(dataGridView1.CurrentRow.Index);
                    
                }
                
                db.closeConnection();

            }
        }

        private void Add_button_Click(object sender, EventArgs e)
        {
            if (name_tables.SelectedIndex == 0)
            {
                release release = new release();
                release.Name= textBox1.Text;
                release.Theme= textBox2.Text;
                release.Id_broadcast = int.Parse(textBox3.Text);
                release.Id_producer = int.Parse(textBox4.Text);

                DB db = new DB();
                {
                    // строка запроса, который надо будет выполнить
                    string commandText = "INSERT INTO `release` (name, theme, id_broadcast, id_producer) VALUES(@release.Name,@release.Theme, @release.Id_broadcast, @release.Id_producer)";
                    db.openConnection(); // открыть соединение
                   
                    using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());
                          

                    MySqlParameter nameParam = new MySqlParameter("@release.Name", release.Name); ;
                    Command.Parameters.Add(nameParam);

                    MySqlParameter themeParam = new MySqlParameter("@release.Theme", release.Theme);
                    Command.Parameters.Add(themeParam);

                    MySqlParameter id_broadcastParam = new MySqlParameter("@release.Id_broadcast", release.Id_broadcast);
                    Command.Parameters.Add(id_broadcastParam);

                    MySqlParameter id_producerParam = new MySqlParameter("@release.Id_producer", release.Id_producer);
                    Command.Parameters.Add(id_producerParam);
                    
                    dataGridView1.Rows.Add(1,release.Name, release.Theme, release.Id_broadcast, release.Id_producer);
                    Command.ExecuteNonQuery(); // выполнить запрос          
                    db.closeConnection(); // закрыть соединение

                }
            }
            else
            {
                broadcast broadcast = new broadcast();
                broadcast.Name = textBox1.Text;
                broadcast.Description = textBox2.Text;
                broadcast.Year_of_creation = textBox3.Text;

                DB db = new DB();
                {
                    // строка запроса, который надо будет выполнить
                    string commandText = "INSERT INTO broadcast (name, description, year_of_creation) VALUES(@broadcast.Name,@broadcast.Description, @broadcast.Year_of_creation)";
                    db.openConnection(); // открыть соединение
                    using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());                   
                                         // SQLiteCommand Command = new SQLiteCommand(commandText, Connect);

                    MySqlParameter nameParam = new MySqlParameter("@broadcast.Name", broadcast.Name); ;
                    Command.Parameters.Add(nameParam);

                    MySqlParameter descriptionyParam = new MySqlParameter("@broadcast.Description", broadcast.Description);
                    Command.Parameters.Add(descriptionyParam);

                    MySqlParameter year_of_creationParam = new MySqlParameter("@broadcast.Year_of_creation", broadcast.Year_of_creation);
                    Command.Parameters.Add(year_of_creationParam);
                    dataGridView1.Rows.Add(1,broadcast.Name, broadcast.Description, broadcast.Year_of_creation);
                    Command.ExecuteNonQuery(); // выполнить запрос
                    db.closeConnection(); // закрыть соединение

                }
            }
        }

        private void Save_button_Click(object sender, EventArgs e)
        {
            if (name_tables.SelectedIndex == 0)
            {
                
                release release = new release();
                int number = dataGridView1.CurrentRow.Index+1;
                release.Name = dataGridView1.CurrentRow.Cells[1].Value.ToString();
                release.Theme = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                release.broadcast = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                release.producer = dataGridView1.CurrentRow.Cells[4].Value.ToString();
       
                DB db = new DB();
                {
                    // строка запроса, который надо будет выполнить
                    db.openConnection(); // открыть соединение
                                         
                    string commandText = "UPDATE `release` SET name=@release.Name, Theme=@release.Theme, id_broadcast=@release.Id_broadcast, id_producer = @release.Id_producer where idrelease=@number";
                    //Connect.Open(); // открыть соединение

                   using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());
                    


                    MySqlParameter nameParam = new MySqlParameter("@release.Name", release.Name); ;
                    Command.Parameters.Add(nameParam);

                    MySqlParameter themeParam = new MySqlParameter("@release.Theme", release.Theme);
                    Command.Parameters.Add(themeParam);

                    MySqlParameter id_broadcastParam = new MySqlParameter("@release.Id_broadcast", release.Id_broadcast);
                    Command.Parameters.Add(id_broadcastParam);

                    MySqlParameter id_producerParam = new MySqlParameter("@release.Id_producer", release.Id_producer);
                    Command.Parameters.Add(id_producerParam);
                    MySqlParameter numberParam = new MySqlParameter("@number", number);
                    Command.Parameters.Add(numberParam);
                    
                    Command.ExecuteNonQuery(); // выполнить запрос
                    dataGridView1.CurrentRow.Cells[1].Value = release.Name;
                    dataGridView1.CurrentRow.Cells[2].Value = release.Theme;
                    dataGridView1.CurrentRow.Cells[3].Value = release.broadcast;
                    dataGridView1.CurrentRow.Cells[4].Value = release.producer;
                    db.closeConnection(); // закрыть соединение

                }
            }
            else
            {
                broadcast broadcast = new broadcast();
                int number = dataGridView1.CurrentRow.Index+1;
                broadcast.Name = dataGridView1.CurrentRow.Cells[1].Value.ToString();
                broadcast.Description = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                broadcast.Year_of_creation= dataGridView1.CurrentRow.Cells[3].Value.ToString();
                DB db = new DB();
                {
                    // строка запроса, который надо будет выполнить
                    string commandText = "UPDATE broadcast SET name=@broadcast.Name, description=@broadcast.Description, year_of_creation=@broadcast.Year_of_creation where Id_broadcast=@number";
                    db.openConnection(); // открыть соединение

                    using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());                   
                                         // SQLiteCommand Command = new SQLiteCommand(commandText, Connect);

                    MySqlParameter nameParam = new MySqlParameter("@broadcast.Name", broadcast.Name); ;
                    Command.Parameters.Add(nameParam);

                    MySqlParameter descriptionyParam = new MySqlParameter("@broadcast.Description", broadcast.Description);
                    Command.Parameters.Add(descriptionyParam);

                    MySqlParameter year_of_creationParam = new MySqlParameter("@broadcast.Year_of_creation", broadcast.Year_of_creation);
                    Command.Parameters.Add(year_of_creationParam);

                    MySqlParameter numberParam = new MySqlParameter("@number", number);
                    Command.Parameters.Add(numberParam);
                    Command.ExecuteNonQuery(); // выполнить запрос
                    dataGridView1.CurrentRow.Cells[1].Value = broadcast.Name;
                    dataGridView1.CurrentRow.Cells[2].Value = broadcast.Description;
                    dataGridView1.CurrentRow.Cells[3].Value = broadcast.Year_of_creation;
                    db.closeConnection(); // закрыть соединение
                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(name_tables.SelectedIndex == 0)
            {
                dataGridView1.Rows.Clear();
                this.dataGridView1.Columns["Column1"].Visible = false;
                this.dataGridView1.Columns["Column5"].Visible = true;
                label1.Visible = true;
                label4.Visible = true;
                textBox4.Visible = true;
                label1.Text ="Название";
                label2.Text = "Тема";
                label3.Text = "id передачи";
                label4.Text = "id режиссера";
                Column2.HeaderText = "Название";
                Column3.HeaderText = "Тема";
                Column4.HeaderText = "Название передачи";
                Column5.HeaderText = "Имя режиссера";
                DB db = new DB();
                db.openConnection();
                string commandText = "SELECT idrelease,r.name,r.theme,b.name,p.full_name FROM `release` as r join broadcast as b on r.id_broadcast=b.id_broadcast join producer as p on p.id_producer=r.id_producer";
                using MySqlCommand command = new MySqlCommand(commandText, db.GetConnection());
                using MySqlDataReader reader = command.ExecuteReader();
                List<string[]> data = new List<string[]>();

                while (reader.Read())
                {  
                    data.Add(new string[5]);

                    data[data.Count - 1][0] = reader[0].ToString();
                    data[data.Count - 1][1] = reader[1].ToString();
                    data[data.Count - 1][2] = reader[2].ToString();
                    data[data.Count - 1][3] = reader[3].ToString();
                    data[data.Count - 1][4] = reader[4].ToString();
                }
                reader.Close();
                db.closeConnection();
                


                foreach (string[] s in data)
                    dataGridView1.Rows.Add(s);
                


        }
            else
            {
                dataGridView1.Rows.Clear();
                this.dataGridView1.Columns["Column1"].Visible = false;
                this.dataGridView1.Columns["Column5"].Visible = false;
                label2.Text = "Описание";
                label3.Text = "Год создания";
                label4.Visible = false;
                textBox4.Visible = false;
                Column3.HeaderText = "Описание";
                Column4.HeaderText = "Год создания";
                DB db = new DB();
                db.openConnection();
                string commandText = "select id_broadcast,name,description,year_of_creation from broadcast";
                using MySqlCommand command = new MySqlCommand(commandText, db.GetConnection());
                using MySqlDataReader reader = command.ExecuteReader();
                List<string[]> data = new List<string[]>();

                while (reader.Read())
                {
                    data.Add(new string[4]);

                    data[data.Count - 1][0] = reader[0].ToString();
                    data[data.Count - 1][1] = reader[1].ToString();
                    data[data.Count - 1][2] = reader[2].ToString();
                    data[data.Count - 1][3] = reader[3].ToString();
                }
                reader.Close();
                db.closeConnection();



                foreach (string[] s in data)
                    dataGridView1.Rows.Add(s);


            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            var start_date=dateTimePicker1.Value;
            var end_date= dateTimePicker2.Value;
            DB db = new DB();
            db.openConnection();
            string commandText = "select sum(a.profit) as profit from advertising as a join release_to_advertising as rta on rta.id_advertising = a.id_advertising join `release` as r on r.idrelease = rta.id_release join `schedule` as s on s.id_release = r.idrelease where s.broadcast_date between @start_date and @end_date";
            using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());
            MySqlParameter startParam = new MySqlParameter("@start_date", start_date); ;
            Command.Parameters.Add(startParam);
            MySqlParameter endParam = new MySqlParameter("@end_date", end_date);
            Command.Parameters.Add(endParam);
            Command.ExecuteNonQuery(); // выполнить запрос
            textBox6.Text = Command.ExecuteScalar().ToString();
            db.closeConnection();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            db.openConnection();
            string commandText = "select sum(rtu.`number`) as site_users from `user` as u join release_to_user as rtu on rtu.id_user = u.id_user join `release` as r on r.idrelease = rtu.id_release";
            using MySqlCommand Command = new MySqlCommand(commandText, db.GetConnection());
            textBox5.Text = Command.ExecuteScalar().ToString(); // выполнить запрос
            db.closeConnection();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }
    }
}