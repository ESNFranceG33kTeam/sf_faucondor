<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151116145331 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE committee (id INT AUTO_INCREMENT NOT NULL, chair_id INT NOT NULL, name VARCHAR(255) NOT NULL, createdat DATETIME NOT NULL, UNIQUE INDEX UNIQ_D2F2C2378CA3C745 (chair_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE committee_user (committee_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_1ABDE46AED1A100B (committee_id), INDEX IDX_1ABDE46AA76ED395 (user_id), PRIMARY KEY(committee_id, user_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE committee ADD CONSTRAINT FK_D2F2C2378CA3C745 FOREIGN KEY (chair_id) REFERENCES fo_user (id)');
        $this->addSql('ALTER TABLE committee_user ADD CONSTRAINT FK_1ABDE46AED1A100B FOREIGN KEY (committee_id) REFERENCES committee (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE committee_user ADD CONSTRAINT FK_1ABDE46AA76ED395 FOREIGN KEY (user_id) REFERENCES fo_user (id) ON DELETE CASCADE');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE committee_user DROP FOREIGN KEY FK_1ABDE46AED1A100B');
        $this->addSql('DROP TABLE committee');
        $this->addSql('DROP TABLE committee_user');
    }
}
