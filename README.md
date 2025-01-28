# *RISC-V Based Secure AES-128 Accelerator SoC with Feedback Architecture*

## *Overview*

This project implements a *RISC-V Based Secure AES-128 Accelerator SoC* designed for low-power applications. It integrates an AES-128 encryption coprocessor with an innovative *feedback architecture* that reduces the traditional 10 AES rounds to just 1 round, completing the entire process in only *20 cycles. The AES coprocessor is optimized for performance and power efficiency, using a **feedback mechanism* controlled by the *AES Orchestrator module*.

The project is designed to be integrated into SoCs with an *AHB interface* for seamless communication.

## *Features*
- AES-128 encryption accelerator
- Single AES round (optimized to 20 cycles)
- Feedback architecture for low power and efficient operation
- AHB interface for SoC integration
- Low power consumption optimized for embedded systems
- Designed with modularity for ease of integration into custom SoC designs

## *Design Details*
- *AES Coprocessor*: Implements the AES-128 encryption algorithm. It has been optimized to use a single AES round, reducing the processing time significantly.
- *AES Orchestrator Module*: Manages the feedback process, ensuring the system operates with minimal power consumption while maintaining secure encryption.
- *Feedback Architecture*: The new approach reduces the 10 AES rounds to 1, providing an efficient alternative to traditional AES implementations. This significantly improves performance and reduces the area and power requirements.
- *AHB Interface*: The AES accelerator is designed to seamlessly integrate with SoCs using the AHB protocol, ensuring smooth communication between the AES coprocessor and other system components.

## *System Requirements*
- FPGA or ASIC platform for hardware implementation
- Vivado or equivalent tool for synthesis and implementation
- RISC-V compatible environment (for testing and integration with RISC-V based SoCs)
- Power and area evaluation tools (optional)

## *How to Use*

### *1. Clone the Repository*
bash
git clone https://github.com/your-username/repository-name.git
cd repository-name


### *2. Build the Project*
This project can be synthesized using Vivado or a similar FPGA development tool. Use the following commands to synthesize the hardware:
bash
vivado -mode batch -source project.tcl


### *3. Integration with SoC*
- The AES coprocessor can be integrated into your custom SoC using the *AHB interface*. Ensure that the AHB master module can communicate with the AES accelerator and memory-mapped registers are set up correctly.
- You can connect the AES module to a RISC-V processor or any other controller through the AHB interface.

### *4. Test the AES Accelerator*
- Test the AES accelerator with various AES-128 encryption tasks.
- Ensure to monitor the power and area usage to validate the low-power design.

## *File Structure*
- *src/*: Contains all the hardware design files for the AES coprocessor, AES Orchestrator module, and AHB interface.
- *testbench/*: Includes testbench files for simulation and verification of the AES accelerator.
- *documentation/*: Project documentation files.
- *scripts/*: Vivado or synthesis-related scripts for building the project.

## *Licensing*

This project is licensed under the MIT License. See the LICENSE file for details.

## *Acknowledgments*

- Special thanks to *Bassel* for his valuable guidance and support throughout this project.
- Thanks to the open-source RISC-V community and all the contributors who made this project possible.

## *Contact*

For questions or further collaboration, feel free to reach out at:  
*Email*: your-email@example.com  
*LinkedIn*: [Your LinkedIn Profile]
