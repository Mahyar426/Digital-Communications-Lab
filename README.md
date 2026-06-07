<div align="center">

![header](https://readme-typing-svg.demolab.com?font=Fira+Code&size=26&pause=1000&color=00D9FF&center=true&vCenter=true&width=800&lines=📡+Digital+Communications;Modulation.+Coding.+Noise.+Repeat.;Built+from+scratch+in+MATLAB.)

```
 ██████╗ ██████╗ ███╗   ███╗███╗   ███╗███████╗
██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔════╝
██║     ██║   ██║██╔████╔██║██╔████╔██║███████╗
██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║╚════██║
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║███████║
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝
     ASK · BPSK · FSK · QAM · Viterbi · BER
```

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023-FF6B00?style=flat-square&logo=mathworks&logoColor=white)](https://www.mathworks.com/)
[![Domain](https://img.shields.io/badge/Domain-Communications%20Engineering-00D9FF?style=flat-square)](#)
[![Techniques](https://img.shields.io/badge/Techniques-Modulation%20%7C%20Coding%20%7C%20BER-blueviolet?style=flat-square)](#)

</div>

---

A **full-stack digital communications system** built from the ground up in MATLAB — no black boxes, no toolbox shortcuts for the core logic. Every stage of the chain is hand-implemented: signal generation, baseband modulation, passband upconversion, AWGN noise injection, downconversion, demodulation, and channel decoding.

If a bit goes in one end, this system encodes it, modulates it onto a carrier, drags it through a noisy channel, demodulates it, decodes it — and tells you exactly how many didn't survive.

---

## 🔗 The Communication Chain

```
┌─────────────┐    ┌──────────────┐    ┌──────────────┐    ┌───────────┐
│  Random     │───▶│  Channel     │───▶│  Baseband    │───▶│ Passband  │
│  Bit Stream │    │  Encoder     │    │  Modulator   │    │ Upconvert │
└─────────────┘    └──────────────┘    └──────────────┘    └─────┬─────┘
                                                                  │
                                                            AWGN Channel
                                                                  │
┌─────────────┐    ┌──────────────┐    ┌──────────────┐    ┌─────▼─────┐
│  BER / SNR  │◀───│  Channel     │◀───│  Baseband    │◀───│ Passband  │
│  Analysis   │    │  Decoder     │    │  Demodulator │    │ Downconvert│
└─────────────┘    └──────────────┘    └──────────────┘    └───────────┘
```

Every block in that diagram is a `.m` file in this repo.

---

## 🛠️ What's Built

### Modulation Engine
Custom modem core (`My_modem.m`) supporting **ASK, BPSK, FSK, and QAM** — parameterized by modulation order `M`, carrier frequency `Fc`, symbol period `Tsym`, and SNR. Handles zero-padding for non-integer symbol boundaries automatically.

Analog modulation side: **AM, FM, PM** on Sine / Square / Triangle carriers with FFT spectrum visualization — built to understand *why* bandwidth behaves the way it does before going digital.

### BER Curve Engine
`My_curve.m` runs Monte Carlo simulation over a configurable SNR sweep. It doesn't stop until it accumulates **≥100 bit errors per SNR point** — statistically meaningful curves, not lucky noise runs.

```matlab
% QPSK BER over AWGN — 5 runs, 1000 bits each
[~, BER, SNR] = My_curve(1000, 5, 1000, 0.01, 0.0001, 'PSK', 4);
semilogy(SNR, BER);
```

### Channel Coding Suite
Three error-correction schemes implemented and benchmarked head-to-head on the same BPSK channel:

| Scheme | Rate | Decoder | Behaviour |
|--------|------|---------|-----------|
| Repetition (m=5) | 1/5 | Majority vote | Marginal at low SNR |
| Hamming (7,4) | 4/7 | Syndrome decode | Solid single-error correction |
| Convolutional | ~1/2 | **Viterbi (hard)** | Best — scales with constraint length |

### Interactive GUI
`app2.mlapp` — MATLAB App Designer interface for tuning coding parameters and watching BER curves update live.

---

## 📂 Structure

```
📁 Modulation Lab/
│   ├── 📁 Codes/
│   │   ├── part1,2/     # Analog modulation — AM/FM/PM, FFT spectrum
│   │   ├── Part 3,4/    # Synchronous & asynchronous digital detection
│   │   └── Part 5,6/    # Full BER sweep — ASK, PSK, FSK, QAM
│   └── Report.pdf
│
📁 Channel Coding Lab/
│   ├── My_modem.m          # Core modem engine
│   ├── My_curve.m          # Monte Carlo BER simulator
│   ├── Hamming.m           # (n,k) Hamming coding + BER sweep
│   ├── Convolutional.m     # Convolutional + Viterbi decoder
│   ├── Repeat.m            # Repetition coding + majority vote
│   ├── Baseband_mod/dmod.m # IQ modulator / demodulator
│   ├── base2pass / pass2base.m  # Passband conversion
│   ├── app2.mlapp          # Interactive GUI
│   └── Report.pdf
```

---

## 🚀 Run It

**Requirements:** MATLAB R2020b+ · Communications Toolbox

```matlab
% Compare Hamming (7,4) vs Convolutional coding
[SNR_h, BER_h] = Hamming(7, 4, -20, -5);
[SNR_c, BER_c] = Convolutional(-20, -5, 3, [6 7]);

figure; hold on;
semilogy(SNR_h, BER_h, 'b-o', 'DisplayName', 'Hamming (7,4)');
semilogy(SNR_c, BER_c, 'r-^', 'DisplayName', 'Conv + Viterbi');
legend; xlabel('SNR (dB)'); ylabel('BER');
title('Channel Coding Comparison over AWGN + BPSK');
```

Or open `app2.mlapp` and skip the command line entirely.

---

## 💡 Key Takeaways

- **Viterbi decoding works.** The BER advantage of convolutional coding over uncoded BPSK is dramatic, and improves with longer constraint lengths — memory in the encoder pays off.
- **Hamming is efficient.** Rate-4/7 with single-error correction beats repetition coding (rate-1/5) in almost every SNR regime.
- **Monte Carlo matters.** The ≥100-error threshold per SNR point is non-negotiable for trustworthy curves.
- **Building the chain manually beats calling `modem()`.** Once you've implemented `base2pass` and `pass2base` yourself, you understand exactly what a coherent receiver is doing — and why carrier frequency and sampling rate constraints matter.
