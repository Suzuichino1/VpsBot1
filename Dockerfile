FROM python:3.10-slim

# Linux ရဲ့ C++ components များနှင့် ddddocr အတွက် လိုအပ်သော dependencies များကို သွင်းခြင်း
RUN apt-get update && apt-get install -y \
    libgomp1 \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# ddddocr ကို pip ကနေ တိုက်ရိုက်မရပါက wheel ဖိုင် သို့မဟုတ် ပုံမှန် install အား Docker ထဲတွင် သွင်းခြင်း
RUN pip install --no-cache-dir ddddocr==1.4.11

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "m.py"]
