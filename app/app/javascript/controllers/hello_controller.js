// app/javascript/controllers/hello_controller.js
import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["departmentSelect"];

  connect() {
    const schoolSelect = document.getElementById("school-select");
    schoolSelect.addEventListener("change", this.loadDepartments.bind(this));
  }

  loadDepartments(event) {
    const schoolId = event.target.value;
    const url = `/schools/${schoolId}/departments`; // Update with your actual route

    // Fetch departments related to the selected school
    Rails.ajax({
      url: url,
      type: "GET",
      dataType: "json",
      success: (data) => {
        this.updateDepartmentSelect(data);
      },
      error: (err) => {
        console.error("Error fetching departments:", err);
      },
    });
  }

  updateDepartmentSelect(departments) {
    const departmentSelect = document.getElementById("department-select");
    departmentSelect.innerHTML = ""; // Clear existing options

    const promptOption = document.createElement("option");
    promptOption.value = "";
    promptOption.text = "Select Department";
    departmentSelect.add(promptOption);

    departments.forEach((department) => {
      const option = document.createElement("option");
      option.value = department.id;
      option.text = department.name;
      departmentSelect.add(option);
    });
  }
}
