<?php
    $server = "localhost";
    $username = "root";
    $password = "";
    $database = "catalog_17030948";

    $connect = new mysqli ($server, $username, $password, $database);

    if ($connect->connect_error)
    {
        die("Connection failed: " . $connect->connect_error);
    }
    
    $company = "SELECT * FROM onestopitcompany";
    $return_company = $connect->query($company);

    $companyhead = "SELECT * FROM companyhead";
    $return_companyhead = $connect->query($companyhead);

    $department = "SELECT * FROM department";
    $return_department = $connect->query($department);

    $staffs = "SELECT * FROM staffs";
    $return_staffs = $connect->query($staffs);

    $xml = new DomDocument('1.0','UTF-8');
    $xml ->formatOutput=true;

    while ($row_ = mysqli_fetch_assoc($return_company))
    {

        $onestopit = $xml->createElement("OneStopIT");
        $xml->appendChild($onestopit);

        $companyinfo = $xml->createElement("CompanyInfo");
        $onestopit->appendChild($companyinfo);

        $name=$xml->createElement("Name", $row_["Name"]);
        $companyinfo->appendChild($name);

        $address=$xml->createElement("Address");
        $companyinfo->appendChild($address);

        $city = $xml->createElement("City", $row_["City"]);
        $address->appendChild($city);

        $state = $xml->createElement("State", $row_["State"]);
        $address->appendChild($state);

        $postbox = $xml->createElement("PostBox", $row_["PostBox"]);
        $address->appendChild($postbox);

        $phone=$xml->createElement("Phone", $row_["Phone1"]);
        $companyinfo->appendChild($phone);

        $phone=$xml->createElement("Phone", $row_["Phone2"]);
        $companyinfo->appendChild($phone);

        $website=$xml->createElement("Website", $row_["Website"]);
        $companyinfo->appendChild($website);

        $logo=$xml->createElement("Logo");
        $companyinfo->appendChild($logo);    
        
    }

    $companydepartments=$xml->createElement("CompanyDepartments");
    $onestopit->appendChild($companydepartments);

    while ($row_ = mysqli_fetch_assoc($return_companyhead))
    {

        $companyhead=$xml->createElement("CompanyHead");
        $companydepartments->appendChild($companyhead);

        $headname=$xml->createElement("HeadName", $row_["HeadName"]);
        $companyhead->appendChild($headname);

        $landline=$xml->createElement("Landline", $row_["Landline"]);
        $companyhead->appendChild($landline);

        $mobile=$xml->createElement("Mobile", $row_["Mobile"]);
        $companyhead->appendChild($mobile);

        $email=$xml->createElement("Email", $row_["Email"]);
        $companyhead->appendChild($email);
        
    }

    while ($row_ = mysqli_fetch_assoc($return_department))
    {

        $department=$xml->createElement("Department");
        $department->setAttribute("deptID", $row_["DeptID"]);
        $companydepartments->appendChild($department);
        
        $deptname=$xml->createElement("DeptName", $row_["DeptName"]);
        $department->appendChild($deptname);

        $depthead=$xml->createElement("DeptHead", $row_["DeptHead"]);
        $department->appendChild($depthead);

        $deptdescription=$xml->createElement("DeptDescription", $row_["DeptDescription"]);
        $department->appendChild($deptdescription);

        $numberofprojects=$xml->createElement("NumberOfProjects", $row_["NumberOfProjects"]);
        $department->appendChild($numberofprojects);

    }

    $staffs=$xml->createElement("Staffs");
    $onestopit->appendChild($staffs);

    while ($row_ = mysqli_fetch_assoc($return_staffs))
    {

        $staff=$xml->createElement("Staff");
        $staff->setAttribute("DeptID", $row_["DeptID"]);
        $staff->setAttribute("StaffID", $row_["StaffID"]);
        $staffs->appendChild($staff);

        $staffname=$xml->createElement("StaffName", $row_["StaffName"]);
        $staff->appendChild($staffname);

        $departmentname=$xml->createElement("DepartmentName", $row_["DeptName"]);
        $staff->appendChild($departmentname);

    }
    
    echo "<xmp>" . $xml->saveXML() . "</xmp>";
		$xml->save('catalog_17030948.xml');
		//save XML as a file
?>