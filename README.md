# แบบฟอร์มใบเสร็จรับเงิน ...

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

### เพิ่มรูปตรา...

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

## การใช้งาน AI (เช่น Copilot, ChatGPT) ในการปรับแต่ง

หากต้องการใช้ AI ช่วยในการปรับแต่งเพิ่มเติม ลองใช้พรอมต์ต่อไปนี้:

```
แบบฟอร์มใบเสร็จรับเงินของกรมการจัดหางาน กระทรวงแรงงาน ที่ผมมีอยู่ตอนนี้มีไฟล์ HTML, CSS, JavaScript หลักดังนี้:

1. index.html: ประกอบด้วยโครงสร้าง HTML ของใบเสร็จรับเงินทั้งหมด
2. style.css: ประกอบด้วย CSS สำหรับจัดรูปแบบใบเสร็จให้เหมือนต้นฉบับ
3. script.js: จัดการฟังก์ชันเพิ่มเติม เช่น การพิมพ์, บันทึกข้อมูล, ฯลฯ

ฉันต้องการเพิ่มฟีเจอร์ [อธิบายฟีเจอร์ที่ต้องการ] ช่วยแนะนำวิธีการแก้ไขไฟล์เหล่านี้เพื่อเพิ่มฟีเจอร์ดังกล่าว
```

## License

MIT License

---

โปรเจคนี้พัฒนาโดย [Your Name]
