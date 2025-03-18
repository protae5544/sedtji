# คู่มือการ Deploy แบบฟอร์มใบเสร็จรับเงิน

เอกสารนี้จะแนะนำวิธีการ deploy แบบฟอร์มใบเสร็จรับเงินให้สามารถใช้งานได้บนอินเทอร์เน็ต ผ่าน 2 วิธีหลัก คือ GitHub Pages และ Vercel

## การ Deploy บน GitHub Pages

### ขั้นตอนที่ 1: เตรียมไฟล์และ GitHub Repository

1. สร้าง GitHub repository ใหม่:
   - ไปที่ https://github.com/new
   - ตั้งชื่อ repository เช่น `worker-permit-template`
   - เลือก "Public" repository
   - คลิก "Create repository"

2. โคลน repository ลงเครื่อง (ถ้าคุณใช้ Git):
   ```bash
   git clone https://github.com/YOUR_USERNAME/worker-permit-template.git
   cd worker-permit-template
   ```

3. เพิ่มไฟล์ทั้งหมดเข้าไปใน repository:
   - copy ไฟล์ index.html, style.css, script.js และไฟล์อื่นๆ ทั้งหมดไปยัง directory ของ repository
   - หรือสร้างไฟล์ใหม่โดยตรงในโฟลเดอร์ repository และคัดลอกโค้ดไปใส่

4. Commit และ Push ไปยัง GitHub:
   ```bash
   git add .
   git commit -m "Initial commit: add worker permit receipt template"
   git push origin main
   ```

### ขั้นตอนที่ 2: ตั้งค่า GitHub Pages

1. ไปที่ repository บน GitHub
2. คลิกที่แท็บ "Settings"
3. เลื่อนลงไปที่ส่วน "GitHub Pages"
4. ในส่วน "Source" เลือก branch "main" และตั้งค่า folder เป็น "/ (root)"
5. คลิก "Save"
6. หลังจากนั้นสักครู่ GitHub จะแสดง URL ที่เว็บไซต์ของคุณถูก deploy แล้ว (โดยปกติจะเป็น `https://YOUR_USERNAME.github.io/worker-permit-template/`)

### การอัพเดทเว็บไซต์

เมื่อต้องการแก้ไขเนื้อหาบนเว็บไซต์:
1. แก้ไขไฟล์ในเครื่องของคุณ
2. Commit และ Push การเปลี่ยนแปลง:
   ```bash
   git add .
   git commit -m "Update: เพิ่มรายละเอียดการแก้ไข"
   git push origin main
   ```
3. GitHub Pages จะอัพเดทเว็บไซต์อัตโนมัติภายในไม่กี่นาที

## การ Deploy บน Vercel

### ขั้นตอนที่ 1: เตรียม GitHub Repository

ทำตามขั้นตอนเดียวกันกับการเตรียม repository สำหรับ GitHub Pages ด้านบน

### ขั้นตอนที่ 2: สร้าง Account Vercel และเชื่อมต่อกับ GitHub

1. ไปที่ [Vercel](https://vercel.com/) และสร้างบัญชีใหม่ (หรือล็อกอินถ้ามีบัญชีอยู่แล้ว)
2. เมื่อล็อกอินแล้ว คลิกที่ "Add New..." > "Project"
3. เลือก "Import Git Repository" และเชื่อมต่อกับบัญชี GitHub ของคุณ
4. อนุญาตให้ Vercel เข้าถึง repository ที่ต้องการ

### ขั้นตอนที่ 3: Import และ Deploy Project

1. หลังจากเชื่อมต่อกับ GitHub คุณจะเห็นรายการ repository ทั้งหมด
2. ค้นหาและเลือก repository `worker-permit-template` ที่คุณสร้างไว้
3. ในหน้าการตั้งค่า:
   - **Framework Preset**: เลือก "Other" หรือ "Static Site"
   - **Build Command**: เว้นว่างไว้ (เนื่องจากเป็น Static HTML)
   - **Output Directory**: เว้นว่างไว้ (เพราะไฟล์ HTML อยู่ใน root directory)
4. คลิก "Deploy"

### ขั้นตอนที่ 4: ตรวจสอบและแชร์ URL

1. หลังจาก Deploy สำเร็จ คุณจะได้รับ URL ในรูปแบบ `https://worker-permit-template.vercel.app`
2. คลิกที่ URL เพื่อตรวจสอบว่าเว็บไซต์ของคุณทำงานถูกต้อง
3. คุณสามารถแชร์ URL นี้กับผู้อื่นเพื่อให้พวกเขาเข้าถึงแบบฟอร์มใบเสร็จได้

### การอัพเดทเว็บไซต์บน Vercel

Vercel จะอัพเดทโปรเจคของคุณโดยอัตโนมัติเมื่อคุณ push การเปลี่ยนแปลงไปยัง GitHub repository:
1. แก้ไขไฟล์ในเครื่องของคุณ
2. Commit และ Push การเปลี่ยนแปลง:
   ```bash
   git add .
   git commit -m "Update: เพิ่มรายละเอียดการแก้ไข"
   git push origin main
   ```
3. Vercel จะตรวจพบการเปลี่ยนแปลงและ deploy เวอร์ชันใหม่โดยอัตโนมัติ

## การแก้ไขปัญหาที่พบบ่อย

### รูปภาพไม่แสดงผล

1. ตรวจสอบว่า URL ของรูปภาพถูกต้อง
2. ถ้าใช้ path แบบ relative เช่น `/images/logo.png` อาจต้องแก้ไขเป็น `./images/logo.png`
3. ตรวจสอบว่าได้อัปโหลดรูปภาพไปยัง repository แล้ว

### แบบฟอร์มแสดงผลไม่ถูกต้อง

1. ตรวจสอบ CSS ว่ามีการเรียกใช้ถูกต้อง
2. ตรวจสอบว่า CSS ที่เกี่ยวกับ @media print ทำงานได้อย่างถูกต้อง
3. ทดสอบบนเบราว์เซอร์หลายๆ ตัวเพื่อให้แน่ใจว่ารองรับได้ดี

### JavaScript ไม่ทำงาน

1. เปิด Console ใน Browser Developer Tools เพื่อดู error messages
2. ตรวจสอบว่า script.js ถูกเรียกใช้อย่างถูกต้องใน HTML
3. แก้ไข code ให้ถูกต้องตาม error messages ที่พบ

## การใช้งาน Custom Domain กับ Vercel

หากต้องการใช้โดเมนของคุณเองแทนที่จะใช้ vercel.app:

1. ไปที่ Dashboard ของโปรเจคบน Vercel
2. ไปที่ "Settings" > "Domains"
3. เพิ่มโดเมนที่คุณเป็นเจ้าของ
4. ทำตามคำแนะนำในการปรับ DNS settings

---

หากคุณยังคงมีคำถามหรือพบปัญหาในการ deploy โปรดสร้าง issue ใหม่ใน GitHub repository หรือติดต่อผู้พัฒนา
