/**
 * Thai Worker Permit Receipt
 * 
 * This script adds interactive functionality to the receipt form:
 * 1. Auto-fills the current date
 * 2. Adds a print button
 * 3. Preserves user input with localStorage
 */

// Format the date as "DD/MM/YY HH:MM น."
function formatThaiDate() {
  const now = new Date();
  
  // Add 543 years to convert to Buddhist Era (BE)
  const thaiYear = now.getFullYear() + 543;
  
  // Format as DD/MM/YY
  const day = String(now.getDate()).padStart(2, '0');
  const month = String(now.getMonth() + 1).padStart(2, '0');
  const shortThaiYear = String(thaiYear).slice(2);
  
  // Format as HH:MM
  const hours = String(now.getHours()).padStart(2, '0');
  const minutes = String(now.getMinutes()).padStart(2, '0');
  
  return `${day}/${month}/${shortThaiYear} ${hours}:${minutes} น.`;
}

// Add a print button to the page
function addPrintButton() {
  const printButton = document.createElement('button');
  printButton.innerText = 'พิมพ์ใบเสร็จ';
  printButton.className = 'print-button';
  
  printButton.addEventListener('click', () => {
    saveFormData(); // Save data before printing
    window.print();
  });
  
  document.body.appendChild(printButton);
}

// Save all form data to localStorage
function saveFormData() {
  const formValues = document.querySelectorAll('[contenteditable="true"]');
  const formData = {};
  
  formValues.forEach((element, index) => {
    formData[`field_${index}`] = element.innerText;
  });
  
  localStorage.setItem('receipt_form_data', JSON.stringify(formData));
}

// Load saved form data from localStorage
function loadFormData() {
  const savedData = localStorage.getItem('receipt_form_data');
  
  if (savedData) {
    const formData = JSON.parse(savedData);
    const formFields = document.querySelectorAll('[contenteditable="true"]');
    
    formFields.forEach((element, index) => {
      if (formData[`field_${index}`]) {
        element.innerText = formData[`field_${index}`];
      }
    });
  }
}

// Set up auto-save for form fields
function setupAutoSave() {
  const formFields = document.querySelectorAll('[contenteditable="true"]');
  
  formFields.forEach(field => {
    field.addEventListener('blur', saveFormData);
  });
}

// Initialize the page
function initPage() {
  // Set the current date
  document.getElementById('current-date').innerText = formatThaiDate();
  
  // Add print button
  addPrintButton();
  
  // Load saved form data
  loadFormData();
  
  // Set up auto-save
  setupAutoSave();
}

// Run when DOM is fully loaded
document.addEventListener('DOMContentLoaded', initPage);
