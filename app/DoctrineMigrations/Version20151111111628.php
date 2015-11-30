<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151111111628 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fo_user ADD section_id INT DEFAULT NULL, DROP section');
        $this->addSql('ALTER TABLE fo_user ADD CONSTRAINT FK_9A3C4A61D823E37A FOREIGN KEY (section_id) REFERENCES section (id)');
        $this->addSql('CREATE INDEX IDX_9A3C4A61D823E37A ON fo_user (section_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fo_user DROP FOREIGN KEY FK_9A3C4A61D823E37A');
        $this->addSql('DROP INDEX IDX_9A3C4A61D823E37A ON fo_user');
        $this->addSql('ALTER TABLE fo_user ADD section VARCHAR(255) DEFAULT NULL COLLATE utf8_unicode_ci, DROP section_id');
    }
}
