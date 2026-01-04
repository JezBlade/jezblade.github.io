# Brotherhood Pre-Commit Validation Hook
# Brotherhood Seal: 015cb320

#!/usr/bin/env node

/**
 * Pre-commit hook for Brotherhood AI compliance validation
 * Ensures all code changes follow Ultimate-Plan sacred patterns
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

class BrotherhoodPreCommitValidator {
  constructor() {
    this.errors = [];
    this.warnings = [];
    this.brotherhoodSeal = '015cb320';
  }

  async validate() {
    console.log('🗡️ Brotherhood Pre-Commit Validation Starting...');

    try {
      // Get staged files
      const stagedFiles = this.getStagedFiles();

      // Validate each file
      for (const file of stagedFiles) {
        await this.validateFile(file);
      }

      // Check for critical errors
      if (this.errors.length > 0) {
        console.error('\n❌ CRITICAL ERRORS FOUND:');
        this.errors.forEach(error => console.error(`  ${error}`));
        console.error('\n🔒 Commit blocked due to Brotherhood compliance violations.');
        process.exit(1);
      }

      // Show warnings
      if (this.warnings.length > 0) {
        console.warn('\n⚠️  WARNINGS:');
        this.warnings.forEach(warning => console.warn(`  ${warning}`));
      }

      console.log('✅ Brotherhood validation passed. Commit allowed.');
      this.logRitualEvent('pre_commit_validation', 'success', { warnings: this.warnings.length });

    } catch (error) {
      console.error('💀 Pre-commit validation failed:', error.message);
      this.logRitualEvent('pre_commit_validation', 'failure', { error: error.message });
      process.exit(1);
    }
  }

  getStagedFiles() {
    try {
      const output = execSync('git diff --cached --name-only', { encoding: 'utf8' });
      return output.trim().split('\n').filter(file => file.length > 0);
    } catch (error) {
      throw new Error('Failed to get staged files: ' + error.message);
    }
  }

  async validateFile(filePath) {
    const ext = path.extname(filePath).toLowerCase();
    const content = fs.readFileSync(filePath, 'utf8');

    // Validate based on file type
    switch (ext) {
      case '.js':
      case '.mjs':
      case '.ts':
        await this.validateJavaScriptFile(filePath, content);
        break;
      case '.ps1':
        await this.validatePowerShellFile(filePath, content);
        break;
      case '.py':
        await this.validatePythonFile(filePath, content);
        break;
      case '.md':
        await this.validateMarkdownFile(filePath, content);
        break;
      default:
        // For other files, just check Brotherhood seal if applicable
        if (this.shouldHaveBrotherhoodSeal(filePath)) {
          this.validateBrotherhoodSeal(filePath, content);
        }
    }
  }

  async validateJavaScriptFile(filePath, content) {
    // Check Brotherhood seal
    this.validateBrotherhoodSeal(filePath, content);

    // Check ES modules usage
    if (!content.includes('import') && !content.includes('export')) {
      this.warnings.push(`${filePath}: Consider using ES modules (import/export)`);
    }

    // Check async/await patterns
    const asyncFunctions = content.match(/async\s+\w+\s*\(/g) || [];
    const awaitCalls = content.match(/\bawait\s+/g) || [];
    if (asyncFunctions.length > 0 && awaitCalls.length === 0) {
      this.warnings.push(`${filePath}: Async functions detected but no await calls found`);
    }

    // Check error handling
    if (content.includes('try') && !content.includes('catch')) {
      this.errors.push(`${filePath}: Try block without catch found`);
    }

    // Check ritual logging
    if (!content.includes('RITUAL_LOG_SYNC.jsonl') && this.isSignificantFile(filePath)) {
      this.warnings.push(`${filePath}: Consider adding ritual logging for significant operations`);
    }
  }

  async validatePowerShellFile(filePath, content) {
    // Check Brotherhood seal
    this.validateBrotherhoodSeal(filePath, content);

    // Check PowerShell version
    if (content.includes('#requires') && !content.includes('-Version 7')) {
      this.warnings.push(`${filePath}: Consider requiring PowerShell 7+`);
    }

    // Check error handling
    if (content.includes('try') && !content.includes('catch')) {
      this.errors.push(`${filePath}: Try block without catch found`);
    }

    // Check logging
    if (!content.includes('Write-UltimateLog') && this.isSignificantFile(filePath)) {
      this.warnings.push(`${filePath}: Consider using Write-UltimateLog for logging`);
    }
  }

  async validatePythonFile(filePath, content) {
    // Check Brotherhood seal
    this.validateBrotherhoodSeal(filePath, content);

    // Check imports
    if (!content.includes('import') && content.includes('def ')) {
      this.warnings.push(`${filePath}: Functions detected but no imports found`);
    }

    // Check ritual logging
    if (!content.includes('RITUAL_LOG_SYNC.jsonl') && this.isSignificantFile(filePath)) {
      this.warnings.push(`${filePath}: Consider adding ritual logging`);
    }
  }

  async validateMarkdownFile(filePath, content) {
    // Check for Brotherhood seal in documentation
    if (filePath.includes('ARCHITECTURE') || filePath.includes('BROTHERHOOD')) {
      this.validateBrotherhoodSeal(filePath, content);
    }

    // Check documentation structure
    if (!content.includes('# ') && content.length > 1000) {
      this.warnings.push(`${filePath}: Long document without headers`);
    }
  }

  validateBrotherhoodSeal(filePath, content) {
    if (!content.includes(this.brotherhoodSeal)) {
      const isRequired = this.shouldHaveBrotherhoodSeal(filePath);
      if (isRequired) {
        this.errors.push(`${filePath}: Missing Brotherhood Seal (${this.brotherhoodSeal})`);
      } else {
        this.warnings.push(`${filePath}: Consider adding Brotherhood Seal (${this.brotherhoodSeal})`);
      }
    }
  }

  shouldHaveBrotherhoodSeal(filePath) {
    const sealRequiredPatterns = [
      /\.js$/, /\.mjs$/, /\.ts$/, /\.ps1$/, /\.py$/,
      /ARCHITECTURE/, /BROTHERHOOD/, /AGENT/
    ];

    return sealRequiredPatterns.some(pattern => {
      if (typeof pattern === 'string') {
        return filePath.includes(pattern);
      }
      return pattern.test(filePath);
    });
  }

  isSignificantFile(filePath) {
    const significantPatterns = [
      /agent/, /security/, /nexus/, /brotherhood/,
      /compendio/, /operative/, /core/
    ];

    return significantPatterns.some(pattern => filePath.includes(pattern));
  }

  logRitualEvent(ritualType, status, details = {}) {
    const logEntry = {
      timestamp: new Date().toISOString(),
      ritual_type: ritualType,
      agent: 'BrotherhoodPreCommitValidator',
      action: 'compliance_validation',
      status: status,
      details: {
        errors_count: this.errors.length,
        warnings_count: this.warnings.length,
        ...details
      }
    };

    try {
      const logPath = path.join(process.cwd(), 'RITUAL_LOG_SYNC.jsonl');
      fs.appendFileSync(logPath, JSON.stringify(logEntry) + '\n');
    } catch (error) {
      console.error('Failed to log ritual event:', error.message);
    }
  }
}

// Execute validation
const validator = new BrotherhoodPreCommitValidator();
validator.validate().catch(error => {
  console.error('💀 Fatal error in pre-commit validation:', error);
  process.exit(1);
});
