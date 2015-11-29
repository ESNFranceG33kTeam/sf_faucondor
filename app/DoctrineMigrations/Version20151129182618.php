<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151129182618 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE points ADD from_id INT DEFAULT NULL, ADD to_id INT DEFAULT NULL, DROP receiver');
        $this->addSql('ALTER TABLE points ADD CONSTRAINT FK_27BA8E2978CED90B FOREIGN KEY (from_id) REFERENCES fo_user (id)');
        $this->addSql('ALTER TABLE points ADD CONSTRAINT FK_27BA8E2930354A65 FOREIGN KEY (to_id) REFERENCES fo_user (id)');
        $this->addSql('CREATE INDEX IDX_27BA8E2978CED90B ON points (from_id)');
        $this->addSql('CREATE INDEX IDX_27BA8E2930354A65 ON points (to_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE points DROP FOREIGN KEY FK_27BA8E2978CED90B');
        $this->addSql('ALTER TABLE points DROP FOREIGN KEY FK_27BA8E2930354A65');
        $this->addSql('DROP INDEX IDX_27BA8E2978CED90B ON points');
        $this->addSql('DROP INDEX IDX_27BA8E2930354A65 ON points');
        $this->addSql('ALTER TABLE points ADD receiver VARCHAR(255) NOT NULL COLLATE utf8_unicode_ci, DROP from_id, DROP to_id');
    }
}
