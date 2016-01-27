<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20160112225547 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE contact_list (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, createdat DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE contact_list_user (contact_list_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_A6AC2ADBA781370A (contact_list_id), INDEX IDX_A6AC2ADBA76ED395 (user_id), PRIMARY KEY(contact_list_id, user_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE contact_list_user ADD CONSTRAINT FK_A6AC2ADBA781370A FOREIGN KEY (contact_list_id) REFERENCES contact_list (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE contact_list_user ADD CONSTRAINT FK_A6AC2ADBA76ED395 FOREIGN KEY (user_id) REFERENCES fo_user (id) ON DELETE CASCADE');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE contact_list_user DROP FOREIGN KEY FK_A6AC2ADBA781370A');
        $this->addSql('DROP TABLE contact_list');
        $this->addSql('DROP TABLE contact_list_user');
    }
}
