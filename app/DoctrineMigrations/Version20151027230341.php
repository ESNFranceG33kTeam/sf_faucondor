<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151027230341 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fo_user ADD firstname VARCHAR(255) NOT NULL, ADD lastname VARCHAR(255) NOT NULL, ADD address VARCHAR(255) DEFAULT NULL, ADD city VARCHAR(50) DEFAULT NULL, ADD zipcode VARCHAR(5) DEFAULT NULL, ADD galaxy_roles LONGTEXT DEFAULT NULL, ADD section VARCHAR(255) DEFAULT NULL, ADD code_section VARCHAR(255) DEFAULT NULL, ADD galaxy_picture VARCHAR(255) DEFAULT NULL, ADD birthdate DATE DEFAULT NULL, ADD gender VARCHAR(1) DEFAULT NULL, ADD mobile VARCHAR(13) DEFAULT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fo_user DROP firstname, DROP lastname, DROP address, DROP city, DROP zipcode, DROP galaxy_roles, DROP section, DROP code_section, DROP galaxy_picture, DROP birthdate, DROP gender, DROP mobile');
    }
}
