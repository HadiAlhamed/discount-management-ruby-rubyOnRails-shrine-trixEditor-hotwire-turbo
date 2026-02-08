# Discount Management System

A modern Ruby on Rails 8 application designed to manage and distribute discounts through a high-performance UI and a secure JSON API. This project demonstrates Rails patterns, including Hotwire integration, custom backend validations, and automated media processing.

## 🛠 Tech Stack
* **Ruby:** 3.4.8
* **Rails:** 8.1.2
* **Database:** SQLite3
* **Frontend:** Hotwire (Turbo Streams) & Tailwind CSS
* **Rich Text:** ActionText (Trix Editor)
* **Image Handling:** Shrine Gem
* **Authentication:** HTTP Basic Auth

## 🚀 Getting Started

### 1. Installation
Clone the repository and install the required gems:
```bash
bundle install

```

### 2. Database Setup

Initialize the database, run migrations, and load the seed data:

```bash
bin/rails db:prepare
bin/rails db:seed

```

### 3. Start the Server

```bash
bin/rails s

```

Access the application at `http://localhost:3000`.

## 📌 Key Features & Implementation

### 1. Reactive UI with Hotwire

Implemented a seamless user experience using **Turbo Streams** to handle form submissions and modal states without custom JavaScript.

* **Success Feedback:** Upon valid submission, the server broadcasts a UI update to a specific modal container.
* **CSS Architecture:** Utilized fixed-position CSS for the modal overlay to ensure consistent centering across various viewport sizes and layout nesting.

### 2. Business Logic

* **Date Validations:** Includes custom model-level validation ensuring all discount expirations are set at least 30 days into the future.
* **Media Handling:** Integrated the **Shrine** gem for robust file uploads, ensuring secure storage and optimized image processing.

### 3. Secure Partner API

Provides a dedicated endpoint at `/api/partners/discounts` for third-party consumption.

* **Security:** Protected via HTTP Basic Authentication.
* **Data Transformation:** The API layer handles key mapping (e.g., mapping internal `title` to external `name`) and provides absolute URLs for hosted assets.

## 📡 API Usage

To retrieve the discount list via the terminal:

```bash
curl -u admin:password http://localhost:3000/api/partners/discounts

```

## 📝 Engineering Decisions

* **Editor Choice:** While various rich-text editors were evaluated (including Lexy), I chose **ActionText (Trix)** for its native integration with the Rails 8 ecosystem. This decision ensured maximum stability, reliable performance with Turbo.
* **Data Integrity:** Used strict backend validations to ensure that data consumed by the API always meets business requirements.

* **UI Resilience:** Inline CSS was used for the modal overlay to guarantee centering and prevent "trapping" by parent Tailwind containers.

* **Seeds:** The db/seeds.rb expects a sample image at test/fixtures/files/rails.png to correctly demonstrate the Shrine attachment process.