// Capa 5: Centralized Logging Configuration
const winston = require('winston');

const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.errors({ stack: true }),
    winston.format.json()
  ),
  defaultMeta: { service: 'JezBlade/jezblade.github.io', capa: 'Capa 5' },
  transports: [
    // Console para desarrollo
    new winston.transports.Console({
      format: winston.format.combine(
        winston.format.colorize(),
        winston.format.simple()
      )
    }),

    // Archivo para producciÃ³n (en implementaciÃ³n real, enviar a servicio centralizado)
    new winston.transports.File({
      filename: 'logs/brotherhood.log',
      maxsize: 5242880, // 5MB
      maxFiles: 5
    })
  ]
});

// Log importante de Capa 5
logger.info('Capa 5: Observabilidad inicializada', {
  timestamp: new Date().toISOString(),
  service: 'JezBlade/jezblade.github.io',
  status: 'operational'
});

module.exports = logger;
