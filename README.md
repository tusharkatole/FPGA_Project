# Interfacing OV7670 camera with FPGA and displaying it in VGA:(This project should be implemented either in Vivado HLS or verilog)

<details>
 <summary> Interface a camera with FPGA, capture and store the image in Block ram, and display the image on the VGA monitor </summary>

# Project Plan

This project can be split into three parts boardly

* **Interfacing the OV7670 camera with the Basys 3 FPGA Board**
* **Reading and Storing the image captured by the camera sensor and storing it in the block ram**
* **Interfacing the FPGA board with VGA controller to display the stored image in the monitor**

 # Protocol Used
 
 ## SCCB

According to spec, SCCB supports only upto 100Khz (not more).

* I2C spec requires pullups with open-collector(drain) drivers everywhere.
*  SCCB requires CMOS-like drivers which are always either +VDD or GND i.e no pullups.
* In I2C, after every 8bits transferred, the 9th bit is designated ACK. The slave pulls SDA low to ack. SCCB designates the 9th bit "dont-care".
* SCCB spec states that the master continues regardless of ACK/NACK in the 9th bit.
 
 SCCB 1: https://chipress.online/2024/07/16/sccb-i-a-protocol-in-image-sensor/ 
 
 SCCB 2: https://chipress.online/2024/07/24/sccb-%e2%85%b1-protocol-signaling/
 
 SCCB 3: https://chipress.online/2024/08/08/sccb%E2%85%B2-protocol-structure/


Pin description of OV7670 camera module


  ![Screenshot from 2024-10-18 10-32-53](https://github.com/user-attachments/assets/e9ec985a-b8ac-4707-a023-fcc6792bd3a5)
  
  

</details>
