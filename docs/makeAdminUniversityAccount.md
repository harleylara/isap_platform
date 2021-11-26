[makeUniversity]: makeUniversity.md
[makeProfessorAccount]: makeProfessorAccount.md
[how_to_start_development]: ../README.md#how-to-start-development

# Make Admin University Account

## Creation of Admin University Account
1. Click "Setting -> Users & Companies -> Users"  
   <img src="images/click_users.png" width="500px" />

2. Click create button and fill information of Admin University account and save.
   - Name: Name of Admin Universtiy
   - Email: Email address of Admin University
   - Access Rights
     - User Type: Internal User
     - Website: blank
     - Administration: blank
     - Employees: blank
     - Recruitment: blank
     - Technical: blank
     - Extra Rights: blank
     - Other: Admin University   
   <img src="images/fill_in_admin_univ.png" width="500px" />

   After saving, appropriate access rights are filled automatically.  
   I used inherit function of groups for this. That's why I ask you to add access rights to inherit in [How to start development][how_to_start_development]

3. Click Edit button and set university made in previous document to "Allowed Companies" and "Default Company".  
   <img src="images/set_univ.png" width="600px" />

4. Activate this account.
   1. log out from Administrator
   1. Click "Reset Password"  
      <img src="images/click_reset_pass.png" width="200px" />  
   1. Enter the Email Address of Admin University account and press Confirm button  
   1. The Error like below picture will emerge but no probrem, please login as a Administorator  
      <img src="images/error_reset.png" width="200px" />  
   1. See the user detail of Admin University account and click the link green background  
      <img src="images/reset_green_link.png" width="500px" />  
   1. Enter the password and press Confirm button


## Add university departments

1. Click "ISAP Recruitment -> Configuration -> Departments"  
   <img src="images/click_department.png" width="400px" />  
2. Press Create button and fill in Department Name and press Save button.  
   <img src="images/add_department.png" width="500px" />  


Prev  
[Make Univerity (Company) Instance][makeUniversity]  

Next  
[Make Professor Account][makeProfessorAccount]
