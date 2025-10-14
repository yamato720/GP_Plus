import struct
import numpy as np

def convert_float_and_hex():
    while True:
        try:
            # 获取输入并判断数字类型
            raw_input = input("请输入数字（浮点、整数或16进制，如0x415D1EB8,h415d1eb8）").strip()
            # 判断是否为16进制输入
            if raw_input.lower().startswith("0x") or raw_input.lower().startswith("h"):
                hex_str = raw_input[2:] if raw_input.lower().startswith("0x") else raw_input[1:]
                # 支持16位、32位、64位长度
                length = len(hex_str)
                if length == 4:  # 16位半精度
                    bytes_val = bytes.fromhex(hex_str)
                    fp16 = np.frombuffer(bytes_val, dtype=np.float16)[0]
                    print(f"16位半精度十进制: {fp16}")
                elif length == 8:  # 32位单精度
                    bytes_val = bytes.fromhex(hex_str)
                    fp32 = struct.unpack('>f', bytes_val)[0]
                    print(f"32位单精度十进制: {fp32}")
                    int32 = struct.unpack('>i', bytes_val)[0]
                    print(f"32位整型十进制: {int32}")
                elif length == 16:  # 64位双精度
                    bytes_val = bytes.fromhex(hex_str)
                    fp64 = struct.unpack('>d', bytes_val)[0]
                    print(f"64位双精度十进制: {fp64}")
                else:
                    print("不支持的16进制长度，仅支持4/8/16位。")
                print("--------------------------")
                break
            else:
                number = float(raw_input)
                is_integer = (int(float(raw_input)) == number)
                
                # 浮点数转换
                print("\n浮点数格式:")
                # 16位半精度（需numpy）
                fp16 = np.float16(number)
                print(f"16位半精度: {fp16.tobytes().hex().upper()} (≈{fp16})")
                
                # 32位单精度
                fp32 = struct.pack('>f', number)
                print(f"32位单精度: {fp32.hex().upper()}")
                
                # 64位双精度
                fp64 = struct.pack('>d', number)
                print(f"64位双精度: {fp64.hex().upper()}")
                
                # 整数额外转换
                if is_integer:
                    integer = int(number)
                    # 32位有符号整数
                    int32 = struct.pack('>i', integer)
                    print(f"\n整数格式:\n32位整型: {int32.hex().upper()}")
                
                print("--------------------------")
                break
        except ValueError:
            print("输入无效，请重新输入数字。")

if __name__ == "__main__":
    while True:
        convert_float_and_hex()