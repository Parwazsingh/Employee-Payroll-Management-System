import pymysql
from getpass import getpass
pending_requests = {}

# Establish a database connection
db_connection = pymysql.connect(
    host="localhost",
    user="root",  # Replace with your MySQL username
    password=getpass("Enter your MySQL password: "),  # Securely enter your MySQL password
    database="project_management2"  # The database we want to connect to
)
cursor = db_connection.cursor()

def main_menu():
    while True:
        print("\n--- Employee Payroll System ---")
        print("1. Admin login")
        print("2. Employee login")
        print("3. Exit")
        user_choice = input("Enter your choice (1/2/3): ")

        if user_choice == '1':
            admin_login()
        elif user_choice == '2':
            employee_login()
        elif user_choice == '3':
            print("Exiting the system.")
            break
        else:
            print("Invalid choice, please try again.")

def admin_login():
    username = input("Enter admin username: ")
    password = getpass("Enter admin password: ")

    try:
     
        query = "SELECT * FROM AdminUsers WHERE username = %s AND hashed_password = %s"
        cursor.execute(query, (username, password))
        admin = cursor.fetchone()

        if admin:
            print(f"Admin {username} logged in successfully.")
            admin_operations()
        else:
            print("Invalid username or password.")
    except Exception as e:
        print(f"An error occurred: {e}")

def employee_login():
    global logged_in_employee_id  # Declare the global variable

    username = input("Enter employee username: ")
    password = getpass("Enter employee password: ")

    try:
        query = "SELECT Employee_Id FROM Employee WHERE username = %s AND hashed_password = %s"
        cursor.execute(query, (username, password))
        result = cursor.fetchone()

        if result:
            logged_in_employee_id = result[0]  
            print(f"Employee {username} logged in successfully.")
            employee_operations()
        else:
            print("Invalid username or password.")
    except Exception as e:
        print(f"An error occurred: {e}")



def admin_operations():
    while True:
        print("\n--- Admin Operations ---")
        print("1. Manage Leave Requests")
        print("2. View total Salary for all employees")
        print("3. Admin Controls")
        print("4. Logout")
        admin_choice = input("Enter your choice (1-4): ")

        if admin_choice == '1':
            manage_leave_requests()
        elif admin_choice == '2':
            generate_employee_salary()
        elif admin_choice == '3':
            admin_controls_menu()  
        elif admin_choice == '4':
            print("Logging out...")
            break
        else:
            print("Invalid choice, please try again.")

def admin_controls_menu():
    while True:
        print("\n--- Admin Controls ---")
        print("1. Add Employee")
        print("2. Delete Employee")
        print("3. Check total number of employees")
        print("4. Go Back")

        control_choice = input("Enter your choice (1-3): ")

        if control_choice == '1':
            add_employee()
        elif control_choice == '2':
            delete_employee()
        elif control_choice == '3':
            check_total_employees()    
        elif control_choice == '4':
            return  
        else:
            print("Invalid choice, please try again.")





def employee_operations():
    while True:
        print("\n--- Employee Operations ---")
        print("1. Change Password")
        print("2. Apply for Leave")
        print("3. Delete Leave Request")
        print("4. Check Upcoming Salary")
        print("5. Check Leave Request Status")
        print("6. View Next Salary Deposit Date")
        print("7. Logout")
        employee_choice = input("Enter your choice (1-6): ")

        if employee_choice == '1':
            change_employee_password()  
        elif employee_choice == '2':
            apply_leave()
        elif employee_choice == '3':
            delete_leave_request()
        elif employee_choice == '4':
            calculate_upcoming_salary()
        elif employee_choice == '5':
            check_remaining_leaves()
        elif employee_choice == '6':
            view_next_salary_deposit_date()    
        elif employee_choice == '7':
            print("Logging out...")
            break
        else:
            print("Invalid choice, please try again.")


def manage_leave_requests():
    while True:
        print("\n--- Manage Leave Requests ---")
        print("1. View Pending Leave Requests")
        print("2. Update Leave Request Status")
        print("3. Go Back")
        choice = input("Enter your choice (1-3): ")

        if choice == '1':
            view_pending_leave_requests()
        elif choice == '2':
            update_leave_request_status()  
        elif choice == '3':
            break
        else:
            print("Invalid choice, please try again.")






def view_pending_leave_requests():
    global pending_requests
    query = "SELECT Employee_Id, Week_Number, Year, date_leave_requested, status, number_of_weeks_requested FROM Employee_Week WHERE status = 'Pending'"
    cursor.execute(query)
    requests = cursor.fetchall()
    
    global pending_requests
    pending_requests = {}  # Store pending requests with a sequence number
    
    if requests:
        print("\nPending Leave Requests:")
        seq_num = 1
        for request in requests:
            print(f"{seq_num}. Employee ID: {request[0]}, Week Number: {request[1]}, Year: {request[2]}, Request Date: {request[3]}, Status: {request[4]}, Number of Weeks: {request[5]}")
            pending_requests[seq_num] = request
            seq_num += 1
    else:
        print("\nNo pending leave requests.")




def update_leave_request_status():
    global pending_requests
    view_pending_leave_requests()  

    if not pending_requests:
        print("No pending requests to update.")
        return

    try:
        seq_num = int(input("Enter the sequence number of the leave request to update: "))
        if seq_num not in pending_requests:
            print("Invalid sequence number.")
            return

        selected_request = pending_requests[seq_num]
        new_status = input("Enter the new status (Approved/Declined): ")

        # Validate the new status
        if new_status not in ["Approved", "Declined"]:
            print("Wrong input. Please select from the two options above.")
            return

        query = "UPDATE Employee_Week SET status = %s WHERE Employee_Id = %s AND Week_Number = %s AND Year = %s"
        cursor.execute(query, (new_status, selected_request[0], selected_request[1], selected_request[2]))
        db_connection.commit()
        print("Leave request status updated.")
    except ValueError:
        print("Invalid input. Please enter a valid number.")
    except Exception as e:
        print(f"An error occurred: {e}")
        db_connection.rollback()




import datetime

import datetime


def apply_leave():
    global logged_in_employee_id

    if logged_in_employee_id is None:
        print("No employee is currently logged in.")
        return

    try:
        leave_date_str = input("Enter start date for leave (YYYY-MM-DD): ")
        leave_date = datetime.datetime.strptime(leave_date_str, "%Y-%m-%d").date()
        number_of_weeks_requested = int(input("Enter the number of weeks requested: "))

        
        if number_of_weeks_requested > 6:
            print("Leave request cannot exceed 6 weeks.")
            return

        
        week_number = leave_date.isocalendar()[1]
        year = leave_date.year

    
        cursor = db_connection.cursor()

        
        cursor.execute("SELECT COUNT(*) FROM Week WHERE Week_Number = %s AND Year = %s", (week_number, year))
        if cursor.fetchone()[0] == 0:
            cursor.execute("INSERT INTO Week (Week_Number, Year) VALUES (%s, %s)", (week_number, year))
            db_connection.commit()

        
        check_query = "SELECT COUNT(*) FROM Employee_Week WHERE Employee_Id = %s AND Week_Number = %s AND Year = %s"
        cursor.execute(check_query, (logged_in_employee_id, week_number, year))
        if cursor.fetchone()[0] > 0:
            print("You already have a leave request for this period.")
            return

        
        insert_query = """
        INSERT INTO Employee_Week (Employee_Id, Week_Number, Year, date_leave_requested, number_of_weeks_requested, status)
        VALUES (%s, %s, %s, %s, %s, 'Pending')
        """
        cursor.execute(insert_query, (logged_in_employee_id, week_number, year, leave_date, number_of_weeks_requested))
        db_connection.commit()
        print("Leave request successfully submitted.")

    except ValueError:
        print("Invalid input. Please enter the correct format.")
        db_connection.rollback()
    except Exception as e:
        print(f"An error occurred: {e}")
        db_connection.rollback()




def delete_leave_request():
    global logged_in_employee_id

    if logged_in_employee_id is None:
        print("No employee is currently logged in.")
        return

    try:
        
        query = """
        SELECT Week_Number, Year, date_leave_requested, number_of_weeks_requested, status 
        FROM Employee_Week 
        WHERE Employee_Id = %s AND status = 'Pending'
        """
        cursor.execute(query, (logged_in_employee_id,))
        leave_requests = cursor.fetchall()

        if not leave_requests:
            print("You have no pending leave requests.")
            return

        
        print("\nYour Pending Leave Requests:")
        for i, request in enumerate(leave_requests, 1):
            print(f"{i}. Week Number: {request[0]}, Year: {request[1]}, Request Date: {request[2]}, Number of Weeks: {request[3]}, Status: {request[4]}")

        
        choice = int(input("Enter the sequence number of the leave request you want to delete: "))
        if choice < 1 or choice > len(leave_requests):
            print("Invalid choice.")
            return

        selected_request = leave_requests[choice - 1]

        
        delete_query = """
        DELETE FROM Employee_Week 
        WHERE Employee_Id = %s AND Week_Number = %s AND Year = %s AND status = 'Pending'
        """
        cursor.execute(delete_query, (logged_in_employee_id, selected_request[0], selected_request[1]))
        db_connection.commit()

        if cursor.rowcount > 0:
            print("Leave request successfully deleted.")
        else:
            print("Unable to delete the request. It may have been processed or the Request ID is incorrect.")

    except ValueError:
        print("Invalid input. Please enter a valid number.")
        db_connection.rollback()
    except Exception as e:
        print(f"An error occurred: {e}")
        db_connection.rollback()


import datetime


def check_remaining_leaves():
    global logged_in_employee_id

    if logged_in_employee_id is None:
        print("No employee is currently logged in.")
        return []
    try:
        
        query = """
        SELECT Week_Number, Year, date_leave_requested, number_of_weeks_requested, status 
        FROM Employee_Week 
        WHERE Employee_Id = %s
        """
        cursor.execute(query, (logged_in_employee_id,))
        leave_requests = cursor.fetchall()

        if not leave_requests:
            print("No leave requests found.")
            return []

        print("Leave Requests:")
        for idx, request in enumerate(leave_requests, start=1):
            print(f"{idx}. Week Number: {request[0]}, Year: {request[1]}, Request Date: {request[2]}, Number of Weeks: {request[3]}, Status: {request[4]}")

    except Exception as e:
        print(f"An error occurred: {e}")

    return leave_requests




def add_employee():
    
    def choose_option(options, option_type):
        for i, option in enumerate(options, 1):
            print(f"{i}. {option}")
        choice = int(input(f"Select {option_type}: ")) - 1
        return options[choice] if 0 <= choice < len(options) else None

    
    cursor = db_connection.cursor()

    
    cursor.execute("SELECT Department_Name FROM Department")
    departments = [item[0] for item in cursor.fetchall()]
    cursor.execute("SELECT Bank_Name FROM Bank")
    banks = [item[0] for item in cursor.fetchall()]
    cursor.execute("SELECT name_of_location FROM WorkLocation")
    locations = [item[0] for item in cursor.fetchall()]

    
    username = input("Enter username: ")
    first_name = input("Enter first name: ")
    last_name = input("Enter last name: ")
    hire_date = input("Enter hire date (YYYY-MM-DD): ")
    city = input("Enter city: ")
    state = input("Enter state: ")
    salary = input("Enter salary: ")
    default_password = "default_password"
    account_id = input("Enter account ID: ")

    
    print("\nAvailable Departments:")
    department_name = choose_option(departments, "department")
    print("\nAvailable Banks:")
    bank_name = choose_option(banks, "bank")
    print("\nAvailable Locations:")
    location_name = choose_option(locations, "location")

    if not department_name or not bank_name or not location_name:
        print("Invalid selection made.")
        return

    
    try:
        args = [username, first_name, last_name, hire_date, city, state, salary, default_password, bank_name, location_name, department_name, int(account_id), 0]
        cursor.callproc('AddEmployee', args)
        cursor.execute('SELECT @_AddEmployee_12')
        result = cursor.fetchone()[0]

        if result == 1:
            print("Employee added successfully.")
        else:
            print("Failed to add employee.")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        db_connection.commit()
        cursor.close()










def calculate_upcoming_salary():
    emp_id = input("Enter your employee ID: ")
    month_num = input("Enter the month number (1-12): ")
    year_num = input("Enter the year: ")

    try:
        
        
        
        cursor.callproc('calculate_upcoming_salary', [emp_id, month_num, year_num, 0.0])
        
        cursor.execute('SELECT @_calculate_upcoming_salary_3')
        upcoming_salary = cursor.fetchone()[0]  

        print(f"The upcoming salary is: {upcoming_salary}")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        db_connection.commit()




def delete_employee():
    emp_id = input("Enter the employee ID to delete: ")

    try:
        
        
        
        cursor.callproc('delete_employee_proc', [emp_id, ''])
        
        cursor.execute('SELECT @_delete_employee_proc_1')
        result_message = cursor.fetchone()[0]  

        print(result_message)  

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        db_connection.commit()



def view_next_salary_deposit_date():
    try:
        cursor.execute("SELECT next_salary_deposit_date()")
        next_deposit_date = cursor.fetchone()
        print(f"The next salary deposit date is: {next_deposit_date[0]}")
    except Exception as e:
        print(f"An error occurred: {e}")





def check_total_employees():
    try:
        
        cursor.callproc('total_employees_count', [0])
        cursor.execute('SELECT @_total_employees_count_0')
        total_count = cursor.fetchone()
        if total_count is not None:
            print(f"Total number of employees: {total_count[0]}")
        else:
            print("Failed to fetch total employee count.")
    except Exception as e:
        print(f"An error occurred: {e}")




def change_employee_password():
    global logged_in_employee_id

    if logged_in_employee_id is None:
        print("No employee is currently logged in.")
        return

    old_password = input("Enter your old password: ")
    new_password = input("Enter your new password: ")
    result_message = None
    try:
        cursor.callproc('change_employee_password', [logged_in_employee_id, old_password, new_password, 0])

    
        cursor.execute('SELECT @_change_employee_password_3')
        result = cursor.fetchall()

        if result[0][0] == 0:
            print("Error: Old password does not match.")
        else:
            print('Password Changed Successfully' if result[0][0] == 1 else "Unknown error occurred.")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        db_connection.commit()

def generate_employee_salary():
    

    
    
    cursor = db_connection.cursor()

    try:
        
        cursor.callproc("total_salaries_sum", [0.0])
        
        
        cursor.execute("SELECT @_total_salaries_sum_0")
        result = cursor.fetchone()
        
        
        db_connection.commit()
        
        print(result[0])

    except Exception as e:
        print(f"Error: {e}")

    finally:
        
        db_connection.commit()



# Run the application
main_menu()

# Close the database connection when done
db_connection.close()
