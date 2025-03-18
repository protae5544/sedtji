#!/bin/bash

# สคริปต์สำหรับสร้างโปรเจค worker-permit-template และอัพโหลดทุกไฟล์ที่จำเป็น
# วิธีใช้: 
# 1. ให้สิทธิ์ execute: chmod +x create_project.sh
# 2. รัน: ./create_project.sh

# สร้างโฟลเดอร์โปรเจค
echo "กำลังสร้างโฟลเดอร์โปรเจค..."
mkdir -p worker-permit-template
cd worker-permit-template

# สร้างไฟล์ index.html
echo "กำลังสร้างไฟล์ index.html..."
cat > index.html << 'EOL'
<!DOCTYPE html>
<html lang="th">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ใบเสร็จรับเงิน - กรมการจัดหางาน</title>
  <meta name="description" content="แบบฟอร์มใบเสร็จรับเงิน กระทรวงแรงงาน">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="app">
    <div class="receipt-container">
      <div class="receipt">
        <div class="watermark"></div>

        <div class="header">
          <div class="header-left">
            <div id="emblem" class="emblem-placeholder"></div>
            <div class="department-name">กรมการจัดหางาน</div>
            <div class="department-name">กระทรวงแรงงาน</div>
          </div>
          <div class="header-center">
            <div class="title">ใบเสร็จรับเงิน</div>
            <div class="subtitle">ต้นฉบับ</div>
          </div>
          <div class="header-right">
            <div class="form-group">
              <div class="form-label">เลขที่</div>
              <div class="form-value" contenteditable="true"></div>
            </div>
            <div class="form-group">
              <div class="form-label">ที่ทำการ สำนักบริหารแรงงานต่างด้าว</div>
              <div class="form-value" contenteditable="true"></div>
            </div>
            <div class="form-group">
              <div class="form-label">วันที่</div>
              <div class="form-value" contenteditable="true"></div>
            </div>
            <div class="form-group">
              <div class="form-label">เลขที่ใบอนุมัติ</div>
              <div class="form-value" contenteditable="true"></div>
            </div>
          </div>
        </div>

        <div class="form-section">
          <div class="form-group">
            <div class="form-label">เลขรับคำขอที่</div>
            <div class="form-value" contenteditable="true"></div>
          </div>

          <div class="column-layout">
            <div class="column">
              <div class="form-group">
                <div class="form-label">ชื่อผู้ชำระเงิน</div>
                <div class="form-value" contenteditable="true"></div>
              </div>
            </div>
            <div class="column">
              <div class="form-group">
                <div class="form-label">สัญชาติ</div>
                <div class="form-value" contenteditable="true"></div>
              </div>
            </div>
          </div>

          <div class="column-layout">
            <div class="column">
              <div class="form-group">
                <div class="form-label">เลขบัตรประจำตัวคนต่างด้าว</div>
                <div class="form-value" contenteditable="true"></div>
              </div>
            </div>
            <div class="column">
              <div class="form-group">
                <div class="form-label">หมายเลขประจำตัวคนต่างด้าว</div>
                <div class="form-value" contenteditable="true"></div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="form-label">ชื่อนายจ้าง / สถานประกอบการ</div>
            <div class="form-value" contenteditable="true"></div>
          </div>

          <div class="form-group">
            <div class="form-label">เลขประจำตัวนายจ้าง</div>
            <div class="form-value" contenteditable="true"></div>
          </div>
        </div>

        <table>
          <thead>
            <tr>
              <th style="width: 70%;">รายการ</th>
              <th style="width: 30%;">จำนวนเงิน</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1. ค่าธรรมเนียมใบอนุญาตฯ ฉบับละ 100 บาท</td>
              <td class="right-align">100.00</td>
            </tr>
            <tr>
              <td>2. ค่าธรรมเนียมใบอนุญาตทำงาน</td>
              <td class="right-align">900.00</td>
            </tr>
            <tr>
              <td colspan="1" style="text-align: center;">รวมเป็นเงินทั้งสิ้น (บาท)<br/>( หนึ่งพันบาทถ้วน )</td>
              <td class="right-align">1,000.00</td>
            </tr>
          </tbody>
        </table>

        <div class="stamp">ได้รับเงินไว้เป็นการถูกต้องแล้ว</div>

        <div class="footer">
          <div class="footer-left">
            <!-- สำหรับ QR Code ในอนาคต -->
          </div>
          <div class="footer-right">
            <div class="signature">
              <div id="signature-img" class="signature-placeholder"></div>
            </div>
            <div class="stamp">(ลงชื่อ) <span contenteditable="true">นางสาวอาภากร ไพศิรินทรก์</span> (ผู้รับเงิน)</div>
            <div class="stamp">ตำแหน่ง <span contenteditable="true">นักวิชาการแรงงานชำนาญการ</span></div>
          </div>
        </div>

        <div class="tiny-text">
          เอกสารนี้สามารถยืนยันได้ว่ามีการจดทะเบียนคนต่างด้าวตามที่มีชื่อปรากฏในเอกสารนี้ไม่อนุญาตให้นำฉบับจริง จำลอง ดัดแปลง รูปแบบใดโดยไม่ได้รับอนุญาต ตามมติคณะรัฐมนตรีเมื่อวันที่ 26 กันยายน 2567 โดยกรมการจัดหางาน กระทรวงแรงงาน
        </div>

        <div class="tiny-text print-date" style="text-align: right;">
          พิมพ์เอกสาร วันที่ <span id="current-date"></span>
        </div>
      </div>
    </div>
  </div>
  <script src="script.js"></script>
</body>
</html>
EOL

# สร้างไฟล์ style.css
echo "กำลังสร้างไฟล์ style.css..."
cat > style.css << 'EOL'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --primary-color: #333333;
  --secondary-color: #666666;
  --light-gray: #dddddd;
  --very-light-gray: #f8f8f8;
}

body {
  font-family: 'Sarabun', sans-serif;
  background-color: #f5f5f5;
  color: var(--primary-color);
  padding: 20px;
  display: flex;
  justify-content: center;
  min-height: 100vh;
}

.receipt-container {
  display: flex;
  justify-content: center;
  width: 100%;
}

.receipt {
  background: white;
  width: 100%;
  max-width: 794px; /* A4 width */
  min-height: 1123px; /* A4 height */
  padding: 30px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  position: relative;
  margin-bottom: 40px;
}

.header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.header-left {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 30%;
  text-align: center;
}

.header-center {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 40%;
  text-align: center;
}

.header-right {
  display: flex;
  flex-direction: column;
  width: 30%;
  text-align: right;
}

.emblem-placeholder {
  width: 80px;
  height: 80px;
  margin-bottom: 10px;
  background-color: var(--very-light-gray);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}

.emblem-placeholder:after {
  content: "ครุฑ";
  font-size: 12px;
  color: var(--secondary-color);
}

.department-name {
  font-size: 14px;
  font-weight: normal;
  margin-bottom: 5px;
}

.title {
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 5px;
}

.subtitle {
  font-size: 18px;
  margin-bottom: 5px;
}

.form-group {
  display: flex;
  margin-bottom: 15px;
  align-items: flex-end;
}

.form-label {
  flex: 0 0 180px;
  font-weight: normal;
  font-size: 14px;
}

.form-value {
  flex: 1;
  border-bottom: 1px solid var(--light-gray);
  height: 25px;
  display: flex;
  align-items: center;
  min-width: 100px;
  font-size: 14px;
  padding: 2px 0;
}

[contenteditable]:focus {
  outline: 1px solid #cce5ff;
  background-color: #f8f9fa;
}

.column-layout {
  display: flex;
  justify-content: space-between;
}

.column {
  flex: 1;
  margin-right: 10px;
}

.column:last-child {
  margin-right: 0;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin: 20px 0;
}

table, th, td {
  border: 1px solid var(--light-gray);
}

th {
  text-align: center;
  padding: 10px;
  font-weight: bold;
  background-color: var(--very-light-gray);
  font-size: 14px;
}

td {
  padding: 10px;
  text-align: left;
  font-size: 14px;
}

td.right-align {
  text-align: right;
}

.total {
  text-align: center;
  font-weight: bold;
  margin: 20px 0;
}

.watermark {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  opacity: 0.1;
  width: 300px;
  height: 300px;
  background-color: var(--very-light-gray);
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  pointer-events: none;
  z-index: -1;
  border-radius: 50%;
}

.footer {
  margin-top: 30px;
  display: flex;
  justify-content: space-between;
}

.footer-left, .footer-right {
  text-align: center;
  flex: 1;
}

.signature {
  margin-bottom: 15px;
  height: 60px;
  display: flex;
  align-items: flex-end;
  justify-content: center;
}

.signature-placeholder {
  width: 150px;
  height: 50px;
  border-bottom: 1px solid var(--light-gray);
  position: relative;
}

.stamp {
  font-size: 12px;
  margin-top: 10px;
}

.tiny-text {
  font-size: 10px;
  margin-top: 30px;
  color: var(--secondary-color);
}

/* Print button */
.print-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  padding: 10px 15px;
  background-color: #333333;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-family: 'Sarabun', sans-serif;
  font-size: 14px;
  z-index: 1000;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.print-button:hover {
  background-color: #555555;
}

/* Media query for print */
@media print {
  body {
    background: none;
    padding: 0;
  }
  
  .receipt {
    box-shadow: none;
    padding: 15px;
    width: 100%;
    max-width: none;
    min-height: auto;
  }

  .print-button {
    display: none;
  }
}
EOL

# สร้างไฟล์ script.js
echo "กำลังสร้างไฟล์ script.js..."
cat > script.js << 'EOL'
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
EOL

# สร้างไฟล์ README.md
echo "กำลังสร้างไฟล์ README.md..."
cat > README.md << 'EOL'
# แบบฟอร์มใบเสร็จรับเงิน กรมการจัดหางาน

แบบฟอร์มใบเสร็จรับเงินอิเล็กทรอนิกส์สำหรับกรมการจัดหางาน กระทรวงแรงงาน ที่สามารถกรอกข้อมูล บันทึก และพิมพ์ได้

## คุณสมบัติ

- รูปแบบเหมือนใบเสร็จรับเงินต้นฉบับ
- สามารถกรอกข้อมูลได้ทุกช่อง (contenteditable)
- บันทึกข้อมูลอัตโนมัติใน localStorage
- ปุ่มพิมพ์เอกสาร
- รองรับการใช้งานในทุกขนาดจอ (Responsive Design)
- ไม่ต้องการการเชื่อมต่อกับเซิร์ฟเวอร์ (ทำงานแบบ Client-side)

## การติดตั้ง

### วิธีที่ 1: ติดตั้งบน GitHub Pages

1. Fork repository นี้ไปยัง GitHub ของคุณ
2. ไปที่ Settings > Pages ในโปรเจคที่ Fork มา
3. เลือก Source เป็น "main" branch และ Save
4. เว็บไซต์จะถูก deploy ที่ https://[your-username].github.io/worker-permit-template/

### วิธีที่ 2: ติดตั้งบน Vercel

1. Fork repository นี้ไปยัง GitHub ของคุณ
2. เข้าไปที่ [Vercel](https://vercel.com/)
3. เชื่อมต่อกับ GitHub account ของคุณ
4. Import repository ที่ Fork มา
5. ในขั้นตอนการตั้งค่า ไม่จำเป็นต้องเปลี่ยนแปลงค่าใดๆ เพราะโปรเจคนี้เป็น Static HTML
6. คลิก "Deploy" และรอสักครู่
7. เว็บไซต์จะถูก deploy และคุณจะได้รับ URL ที่สามารถเข้าถึงได้

## การปรับแต่ง

### เพิ่มรูปตราครุฑ

เพื่อใส่รูปตราครุฑ ให้แก้ไขไฟล์ `index.html` และเปลี่ยนจาก:

```html
<div id="emblem" class="emblem-placeholder"></div>
```

เป็น:

```html
<img id="emblem" src="path/to/garuda-emblem.png" alt="ตราครุฑ" class="emblem">
```

### เพิ่มลายเซ็น

เพื่อใส่รูปลายเซ็น ให้แก้ไขไฟล์ `index.html` และเปลี่ยนจาก:

```html
<div id="signature-img" class="signature-placeholder"></div>
```

เป็น:

```html
<img id="signature-img" src="path/to/signature.png" alt="ลายเซ็น" style="height: 50px;">
```

### เพิ่มลายน้ำ

เพื่อใส่ลายน้ำตราครุฑ ให้แก้ไขไฟล์ `style.css` และเปลี่ยนจาก:

```css
.watermark {
  /* รายละเอียดอื่นๆ */
  background-color: var(--very-light-gray);
  /* รายละเอียดอื่นๆ */
}
```

เป็น:

```css
.watermark {
  /* รายละเอียดอื่นๆ */
  background-image: url('path/to/watermark.png');
  background-color: transparent;
  /* รายละเอียดอื่นๆ */
}
```

## License

MIT License
EOL

# สร้างไฟล์ .gitignore
echo "กำลังสร้างไฟล์ .gitignore..."
cat > .gitignore << 'EOL'
# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Dependency directories
node_modules/

# Production build folder
/dist

# OS specific files
.DS_Store
Thumbs.db

# Editor directories and files
.idea
.vscode
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?
EOL

echo "การสร้างโปรเจคเสร็จสมบูรณ์!"
echo "โฟลเดอร์โปรเจค: worker-permit-template"
echo "ไฟล์ที่สร้าง: index.html, style.css, script.js, README.md, .gitignore"
echo ""
echo "คำแนะนำต่อไป:"
echo "1. อัพโหลดไฟล์ทั้งหมดไปยัง GitHub"
echo "2. คุณสามารถใช้คำสั่งต่อไปนี้:"
echo "   cd worker-permit-template"
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial commit'"
echo "   git remote add origin https://github.com/YOUR_USERNAME/worker-permit-template.git"
echo "   git push -u origin main"
echo ""
echo "3. ติดตั้งบน GitHub Pages หรือ Vercel ตามคำแนะนำใน README.md"
