# Professional Online Voting System

A comprehensive, secure online voting platform built with Spring Boot, featuring modern UI/UX, database persistence, and Docker deployment.

## 🚀 Features

- **Secure Authentication**: BCrypt password encryption, role-based access control
- **Modern UI/UX**: Professional Bootstrap-based interface with gradient themes
- **Database Integration**: H2 (development) and PostgreSQL (production) support
- **Candidate Management**: Full CRUD operations for election candidates
- **Real-time Results**: Live vote counting and results visualization
- **Admin Dashboard**: Comprehensive election management interface
- **Docker Support**: Containerized deployment with multi-stage builds
- **JavaFX Desktop App**: Optional desktop interface
- **Database Viewer**: Built-in web-based database inspection tool

## 🛠️ Technology Stack

- **Backend**: Spring Boot 3.2.0, Spring Security, Spring Data JPA
- **Frontend**: Thymeleaf, Bootstrap 5.3, Chart.js
- **Database**: H2 (embedded), PostgreSQL (production)
- **Security**: JWT, BCrypt, CSRF protection
- **Containerization**: Docker with Alpine Linux
- **Build Tool**: Maven 3.9+
- **Java Version**: 17+

## 📋 Prerequisites

- Java 17 or higher
- Maven 3.6+
- Docker (optional)
- Git

## 🚀 Quick Start

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/online-voting-system.git
cd online-voting-system
```

### 2. Run with Maven
```bash
mvn clean package -DskipTests
java -jar target/onlinevoting-web-2.0.0.jar
```

### 3. Run with Docker
```bash
docker build -t voting-app .
docker run -d -p 8082:8081 --name voting-container voting-app
```

## 🌐 Access URLs

- **Main Application**: `http://localhost:8081/voting/`
- **Admin Dashboard**: `http://localhost:8081/voting/admin/dashboard`
- **H2 Database Console**: `http://localhost:8081/voting/h2-console`
- **Database Viewer**: `http://localhost:8081/voting/admin/database`

## 👥 Default Credentials

### Admin Account
- **Username**: `admin`
- **Password**: `admin123`

### Test Voter Account
- **Username**: `voter1`
- **Password**: `password123`

## 🗄️ Database Configuration

### H2 (Default - Development)
```properties
spring.datasource.url=jdbc:h2:file:./data/votingdb
spring.datasource.username=sa
spring.datasource.password=
```

### PostgreSQL (Production)
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/votingdb
spring.datasource.username=voting_user
spring.datasource.password=voting_password
```

## 🐳 Docker Deployment

### Build Image
```bash
docker build -t voting-app .
```

### Run Container
```bash
# Local access
docker run -d -p 8081:8081 --name voting-container voting-app

# Public network access
docker run -d -p 8082:8081 --name voting-container voting-app
```

### Docker Compose (Optional)
```yaml
version: '3.8'
services:
  voting-app:
    build: .
    ports:
      - "8082:8081"
    environment:
      - SPRING_PROFILES_ACTIVE=prod
    volumes:
      - voting_data:/app/data
volumes:
  voting_data:
```

## 📱 Network Access

To make the application accessible from other devices:

1. **Find your IP address**: `ipconfig` (Windows) or `ifconfig` (Linux/Mac)
2. **Access from other devices**: `http://YOUR_IP:8082/voting/`
3. **Ensure firewall allows port 8082**

## 🔧 Configuration

### Application Properties
Key configuration options in `application.properties`:

```properties
# Server Configuration
server.port=8081
server.address=0.0.0.0
server.servlet.context-path=/voting

# Database Configuration
spring.datasource.url=jdbc:h2:file:./data/votingdb
spring.jpa.hibernate.ddl-auto=update

# Security Configuration
voting.jwt.secret=VotingSystemSecretKey2024
voting.security.bcrypt.rounds=12

# Election Configuration
voting.election.name=General Election 2024
voting.voting.start-time=2024-01-01T08:00:00
voting.voting.end-time=2024-12-31T18:00:00
```

## 🏗️ Project Structure

```
src/
├── main/
│   ├── java/com/voting/
│   │   ├── web/
│   │   │   ├── controller/     # REST controllers
│   │   │   ├── entity/         # JPA entities
│   │   │   ├── repository/     # Data repositories
│   │   │   ├── service/        # Business logic
│   │   │   └── config/         # Configuration classes
│   │   └── javafx/             # JavaFX desktop app
│   └── resources/
│       ├── templates/          # Thymeleaf templates
│       ├── static/             # CSS, JS, images
│       └── application.properties
└── test/                       # Unit tests
```

## 🔐 Security Features

- **Password Encryption**: BCrypt with configurable rounds
- **Role-Based Access**: Admin and Voter roles
- **CSRF Protection**: Enabled for all forms
- **Session Management**: Secure session handling
- **Input Validation**: Server-side validation for all inputs
- **SQL Injection Prevention**: JPA/Hibernate protection

## 📊 Admin Features

- **Dashboard**: Real-time voting statistics
- **Candidate Management**: Add, edit, delete, activate/deactivate candidates
- **User Management**: View registered voters and voting status
- **Results Visualization**: Charts and graphs for election results
- **Database Viewer**: Direct database inspection tool
- **Export Functionality**: Download election data

## 🗳️ Voter Features

- **Secure Registration**: Account creation with validation
- **Candidate Browsing**: View all active candidates
- **Secure Voting**: One vote per user enforcement
- **Vote Confirmation**: Clear feedback on vote submission
- **Results Viewing**: Access to election results (when enabled)

## 🧪 Testing

### Run Tests
```bash
mvn test
```

### Test Coverage
```bash
mvn jacoco:report
```

## 📈 Performance

- **Database Connection Pooling**: HikariCP for optimal performance
- **Caching**: Spring Boot caching for frequently accessed data
- **Compression**: Gzip compression for web responses
- **Optimized Queries**: Efficient JPA queries with proper indexing

## 🔄 CI/CD

### GitHub Actions (Example)
```yaml
name: CI/CD Pipeline
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-java@v3
        with:
          java-version: '17'
      - run: mvn test
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: docker build -t voting-app .
```

## 🐛 Troubleshooting

### Common Issues

1. **Port Already in Use**
   ```bash
   # Change port in application.properties
   server.port=8082
   ```

2. **Database Connection Issues**
   ```bash
   # Check H2 console at /h2-console
   # Verify JDBC URL: jdbc:h2:file:./data/votingdb
   ```

3. **Docker Build Fails**
   ```bash
   # Clean Maven cache
   mvn clean
   docker system prune
   ```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

For support and questions:
- Create an issue on GitHub
- Check the documentation in `/docs`
- Review the troubleshooting section

## 🎯 Roadmap

- [ ] Mobile app development
- [ ] Blockchain integration for vote verification
- [ ] Multi-language support
- [ ] Advanced analytics dashboard
- [ ] Email notifications
- [ ] Biometric authentication
- [ ] Real-time chat support

---

**Built with ❤️ using Spring Boot and modern web technologies**