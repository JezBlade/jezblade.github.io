const express = require('express');
const router = express.Router();

// Health Check Endpoint - Capa 5: Observabilidad
router.get('/health', (req, res) => {
    const health = {
        status: 'healthy',
        timestamp: new Date().toISOString(),
        service: 'JezBlade/jezblade.github.io',
        version: process.env.npm_package_version || '1.0.0',
        uptime: process.uptime(),
        memory: process.memoryUsage(),
        capa: 'Capa 5: Observabilidad Activa'
    };

    // Verificaciones bÃ¡sicas
    const checks = {
        database: true, // Simulado - en producciÃ³n verificar conexiÃ³n real
        external_apis: true, // Simulado
        filesystem: true
    };

    health.checks = checks;

    const isHealthy = Object.values(checks).every(check => check === true);
    health.status = isHealthy ? 'healthy' : 'unhealthy';

    res.status(isHealthy ? 200 : 503).json(health);
});

module.exports = router;
