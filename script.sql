USE [master]
GO
/****** Object:  Database [qcm]    Script Date: 26/06/2017 16:33:03 ******/
CREATE DATABASE [qcm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qcm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\qcm.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'qcm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\qcm_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [qcm] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qcm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qcm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qcm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qcm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qcm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qcm] SET ARITHABORT OFF 
GO
ALTER DATABASE [qcm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [qcm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qcm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qcm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qcm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qcm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qcm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qcm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qcm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qcm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [qcm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qcm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qcm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qcm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qcm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qcm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qcm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qcm] SET RECOVERY FULL 
GO
ALTER DATABASE [qcm] SET  MULTI_USER 
GO
ALTER DATABASE [qcm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qcm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qcm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qcm] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [qcm] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'qcm', N'ON'
GO
USE [qcm]
GO
/****** Object:  Table [dbo].[Inscriptions]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscriptions](
	[idInscription] [int] NOT NULL,
	[dureeValidite] [int] NOT NULL,
	[tempsEcoule] [int] NOT NULL,
	[etat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Inscriptions] PRIMARY KEY CLUSTERED 
(
	[idInscription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medias]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medias](
	[idMedia] [int] NOT NULL,
	[idQuestion] [int] NOT NULL,
	[libelle] [nvarchar](50) NOT NULL,
	[type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Medias] PRIMARY KEY CLUSTERED 
(
	[idMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promo_User]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promo_User](
	[idUser] [int] NOT NULL,
	[idPromo] [int] NOT NULL,
 CONSTRAINT [PK_Promo_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idPromo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[idPromotion] [int] NOT NULL,
	[libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[idPromotion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[idQuestion] [int] NOT NULL,
	[idTheme] [int] NOT NULL,
	[enonce] [nvarchar](50) NOT NULL,
	[type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionsTirages]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsTirages](
	[idQuestionTirage] [int] NOT NULL,
	[idInscription] [int] NOT NULL,
	[idQuestion] [int] NOT NULL,
	[estMarquee] [int] NOT NULL,
 CONSTRAINT [PK_QuestionsTirages] PRIMARY KEY CLUSTERED 
(
	[idQuestionTirage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReponsesDonnees]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReponsesDonnees](
	[idReponseDonnee] [int] NOT NULL,
	[idReponseProposee] [int] NOT NULL,
	[idQuestionTirage] [int] NOT NULL,
 CONSTRAINT [PK_ReponsesDonnees] PRIMARY KEY CLUSTERED 
(
	[idReponseDonnee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReponsesProposees]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReponsesProposees](
	[idReponseProposee] [int] NOT NULL,
	[idQuestion] [int] NOT NULL,
	[enonce] [nvarchar](250) NOT NULL,
	[estBonne] [int] NOT NULL,
 CONSTRAINT [PK_ReponsesProposees] PRIMARY KEY CLUSTERED 
(
	[idReponseProposee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resultats]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultats](
	[idResultat] [int] NOT NULL,
	[idInscription] [int] NOT NULL,
	[resultatObtenu] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Resultats] PRIMARY KEY CLUSTERED 
(
	[idResultat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section_Test]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section_Test](
	[idSectionTest] [int] NOT NULL,
	[idTest] [int] NOT NULL,
	[idTheme] [int] NOT NULL,
	[nbQuestionsATirer] [int] NOT NULL,
 CONSTRAINT [PK_Section_Test] PRIMARY KEY CLUSTERED 
(
	[idSectionTest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tests]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[idTest] [int] NOT NULL,
	[libelle] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[duree] [int] NOT NULL,
	[seuilAcquis] [int] NOT NULL,
	[seuilEnCours] [int] NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[idTest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Themes]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[idTheme] [int] NOT NULL,
	[libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED 
(
	[idTheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/06/2017 16:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] NOT NULL,
	[nom] [nvarchar](50) NOT NULL,
	[penom] [nvarchar](50) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[statut] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inscriptions] ADD  CONSTRAINT [DF_Inscriptions_tempsEcoule]  DEFAULT ((0)) FOR [tempsEcoule]
GO
ALTER TABLE [dbo].[Medias]  WITH CHECK ADD  CONSTRAINT [FK_media_question] FOREIGN KEY([idQuestion])
REFERENCES [dbo].[Questions] ([idQuestion])
GO
ALTER TABLE [dbo].[Medias] CHECK CONSTRAINT [FK_media_question]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_question_Theme] FOREIGN KEY([idTheme])
REFERENCES [dbo].[Themes] ([idTheme])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_question_Theme]
GO
ALTER TABLE [dbo].[QuestionsTirages]  WITH CHECK ADD  CONSTRAINT [FK_questionTirage_inscription] FOREIGN KEY([idInscription])
REFERENCES [dbo].[Inscriptions] ([idInscription])
GO
ALTER TABLE [dbo].[QuestionsTirages] CHECK CONSTRAINT [FK_questionTirage_inscription]
GO
ALTER TABLE [dbo].[QuestionsTirages]  WITH CHECK ADD  CONSTRAINT [FK_questionTirage_question] FOREIGN KEY([idQuestion])
REFERENCES [dbo].[Questions] ([idQuestion])
GO
ALTER TABLE [dbo].[QuestionsTirages] CHECK CONSTRAINT [FK_questionTirage_question]
GO
ALTER TABLE [dbo].[ReponsesDonnees]  WITH CHECK ADD  CONSTRAINT [FK_reponseDonnee_questionTirage] FOREIGN KEY([idQuestionTirage])
REFERENCES [dbo].[QuestionsTirages] ([idQuestionTirage])
GO
ALTER TABLE [dbo].[ReponsesDonnees] CHECK CONSTRAINT [FK_reponseDonnee_questionTirage]
GO
ALTER TABLE [dbo].[ReponsesDonnees]  WITH CHECK ADD  CONSTRAINT [FK_reponseDonnee_reponseProposee] FOREIGN KEY([idReponseProposee])
REFERENCES [dbo].[ReponsesProposees] ([idReponseProposee])
GO
ALTER TABLE [dbo].[ReponsesDonnees] CHECK CONSTRAINT [FK_reponseDonnee_reponseProposee]
GO
ALTER TABLE [dbo].[ReponsesProposees]  WITH CHECK ADD  CONSTRAINT [FK_reponseProposee_question] FOREIGN KEY([idQuestion])
REFERENCES [dbo].[Questions] ([idQuestion])
GO
ALTER TABLE [dbo].[ReponsesProposees] CHECK CONSTRAINT [FK_reponseProposee_question]
GO
ALTER TABLE [dbo].[Resultats]  WITH CHECK ADD  CONSTRAINT [FK_resultat_inscription] FOREIGN KEY([idInscription])
REFERENCES [dbo].[Inscriptions] ([idInscription])
GO
ALTER TABLE [dbo].[Resultats] CHECK CONSTRAINT [FK_resultat_inscription]
GO
ALTER TABLE [dbo].[Section_Test]  WITH CHECK ADD  CONSTRAINT [fk_secionTest_Test] FOREIGN KEY([idTest])
REFERENCES [dbo].[Tests] ([idTest])
GO
ALTER TABLE [dbo].[Section_Test] CHECK CONSTRAINT [fk_secionTest_Test]
GO
ALTER TABLE [dbo].[Section_Test]  WITH CHECK ADD  CONSTRAINT [FK_sectionTest_Theme] FOREIGN KEY([idTheme])
REFERENCES [dbo].[Themes] ([idTheme])
GO
ALTER TABLE [dbo].[Section_Test] CHECK CONSTRAINT [FK_sectionTest_Theme]
GO
USE [master]
GO
ALTER DATABASE [qcm] SET  READ_WRITE 
GO
